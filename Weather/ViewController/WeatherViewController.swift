//
//  WeatherViewController.swift
//  Weather
//
//  Created by Baek on 2023/07/26.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    private let weatherView = WeatherView()
    private let dailyWeatherView = DailyWeatherView()
    private let setWeatherImage = SetWeatherImage()
    
    private let cityListAPI = UserLoactionAPI()
    private let hourlyWeatherAPI = HourlyWeatherAPI()
    private let dailyWeatherAPI = DailyWeatherAPI()
    
    private var cityListData: ResponseCityDataFromLocation?
    private var hourlyWeatherData: HourlyWeatherData?
    private var dailyWeatherData: DailyWeatherData?
    
    private let dataManager = WeatherListDataManager.shared
    private let userInfo = UserInfo.shared
    private let semaphore = DispatchSemaphore(value: 0)
    
    private var userLocationURL = ""
    private var userHourlyURL = ""
    private var userDailyURL = ""
    
    var locationLatitude = 0.0
    var locationLongitude = 0.0
    var addNewCityView = false
    
    var cityNumber = 0
    var cityName = ""
    var citySaveDate = 0.0
    let nowLoction = ""
    var nowCitySet = false
    
    let weatherViewScreenHeight = UIScreen.main.bounds.size.height/4
    let weatherViewStackViewHeight = UIScreen.main.bounds.size.height + 200
    let nowDate = Date()
    let nowDateFormatter = DateFormatter()
    var locationManager: CLLocationManager?
    var currentLocation:CLLocationCoordinate2D!
    
    let weatherScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let scrollUIStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    let collectionBackBlurView: UIVisualEffectView = {
        let blurView = UIBlurEffect(style: .light)
        let outerVisualEffectView = UIVisualEffectView(effect: blurView)
        outerVisualEffectView.translatesAutoresizingMaskIntoConstraints = false
        outerVisualEffectView.layer.cornerRadius = 10
        outerVisualEffectView.clipsToBounds = true
        return outerVisualEffectView
    }()
   
    
    let collectionBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let cityListAddButton: ButtonTouchSizeUp = {
        let button = ButtonTouchSizeUp()
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .default)
        let image = UIImage(systemName: "plus", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityListAddButton.addTarget(self, action: #selector(addCityButton), for: .touchUpInside)
        locationManager?.delegate = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(HourlyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: HourlyWeatherCollectionViewCell.reuseIdentifier)
        setScrollView()
        requestAuthorization()
    }
    
    private func setScrollView() {
        weatherScrollView.frame = self.view.frame
        weatherScrollView.delegate = self
        weatherScrollView.contentSize = CGSize(width: self.view.frame.maxX, height: weatherScrollView.frame.size.height)
    }
    
    private func setBackGround() {
        guard let hourlyData = hourlyWeatherData?.hourlyInformation.first else { return }
        
        let getNowWeatherState = self.setWeatherImage.getNowWeatherImage(by: hourlyData)
        var backgroundTopColor = UIColor.black.cgColor
        var backgroundBottomColor = UIColor.black.cgColor
        
        if(getNowWeatherState == "sunny" || getNowWeatherState == "suncloud") {
            backgroundTopColor = UIColor(hexCode: HexCodeEnum.sunnyTop.hexCode).cgColor
            backgroundBottomColor = UIColor(hexCode: HexCodeEnum.sunnyBottom.hexCode).cgColor
        } else if (getNowWeatherState == "night") {
            backgroundTopColor = UIColor(hexCode: HexCodeEnum.nightTop.hexCode).cgColor
            backgroundBottomColor = UIColor(hexCode: HexCodeEnum.nightBottom.hexCode).cgColor
        } else {
            backgroundTopColor = UIColor(hexCode: HexCodeEnum.cloudTop.hexCode).cgColor
            backgroundBottomColor = UIColor(hexCode: HexCodeEnum.cloudBottom.hexCode).cgColor
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [backgroundTopColor,
                                backgroundBottomColor]
        gradientLayer.locations = [0.3, 0.7]
        self.view.layer.addSublayer(gradientLayer)
    }
    
    
    private func requestAuthorization() {
            if locationManager == nil {
                locationManager = CLLocationManager()
                locationManager!.desiredAccuracy = kCLLocationAccuracyBest
                locationManager!.requestWhenInUseAuthorization()
                locationManager!.delegate = self
                locationManagerDidChangeAuthorization(locationManager!)
            }else{
                locationManager!.startMonitoringSignificantLocationChanges()
            }
    }
    
    private func getCityList(at location: CLLocationCoordinate2D) {
        if (locationLatitude == 0.0 && locationLongitude == 0.0) {
            locationLatitude = location.latitude
            locationLongitude = location.longitude
            userInfo.nowLocationLatitude = locationLatitude
            userInfo.nowLocationLongitude = locationLongitude
        }
        
        userLocationURL = URLCollection.getUserLocationURL+"latitude=\(locationLatitude)&longitude=\(locationLongitude)"
        cityListAPI.dataTask(by: (userLocationURL), completion: { (response) in
            switch response {
            case .success(let data):
                self.cityListData = data
            case .failure(let data):
                print(data)
            }
        })
    }
    
    private func getHourlyWeather() {
        self.nowDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let dateString = nowDateFormatter.string(for: self.nowDate) else { return }
        guard let cityNumberData = self.cityListData?.cityInformation.first else { return }
        if(cityName == "" && cityNumber == 0) {
            cityName = cityNumberData.cityName[0]
            cityNumber = cityNumberData.cityNumber
        }
       
        if(nowCitySet) {
            userInfo.nowCityName = cityName
            userInfo.nowCityNumber = cityNumber
        }
        userHourlyURL = URLCollection.getUserWeatherURL+"\(String(cityNumber))/weathers/\(dateString)/hourly"
        hourlyWeatherAPI.dataTask(by: userHourlyURL, completion: { (response) in
            switch response {
            case .success(let data):
                self.hourlyWeatherData = data
            case .failure(let data):
                print(data)
            }
        })
    }
    
    private func getDailyWeather() {
        guard let dateString = nowDateFormatter.string(for: self.nowDate) else { return }
        guard let cityNumberData = self.cityListData?.cityInformation.first else { return }
        if(cityNumber == 0){
            cityNumber = cityNumberData.cityNumber
        }
        userDailyURL =
        URLCollection.getUserWeatherURL+"\(String(cityNumber))/weathers/\(dateString)/daily"
        dailyWeatherAPI.dataTask(by: userDailyURL, completion: { (response) in
            switch response {
            case .success(let data):
                self.dailyWeatherData = data
            case .failure(let data):
                print(data)
            }
            self.semaphore.signal()
        })
        self.semaphore.wait()
    }
    
    private func checkDuplication() -> Bool {
        guard let weatherListItems = dataManager.fetchWeatherList() else {
            return false
        }
        
        let weatherListItem = weatherListItems
        
        for weatherNameList in 0..<weatherListItem.count {
            if(cityName == weatherListItem[weatherNameList].cityName) {
                return true
            }
        }
        return false
    }
    
    @objc private func addCityButton() {
      citySaveDate = Date().timeIntervalSince1970
        let saveCityData = WeatherListItem(id: UUID(), cityNumber: self.cityNumber, cityName: self.cityName, createdAt: citySaveDate, latitude: self.locationLatitude, longitude: self.locationLongitude)
      dataManager.saveWeatherList(item: saveCityData)
        NotificationCenter.default.post(name: NSNotification.Name("RefreshWeatherList"), object: nil)
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        let weatherListViewCon = WeatherListViewController()
        weatherListViewCon.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(weatherListViewCon, animated: true, completion: nil)
    }
}

// MARK: - Extension
extension WeatherViewController:CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            guard let coordinate = locationManager!.location?.coordinate else { return }
            
            self.getCityList(at: coordinate)
            self.getHourlyWeather()
            self.getDailyWeather()
            guard let locationData = cityListData else { return }
            guard let hourlyData = hourlyWeatherData else { return }
            guard let dailyData = dailyWeatherData else { return }
            weatherView.configureNowLocationData(at: locationData)
            weatherView.configureNowWeatherData(at: hourlyData)
            dailyWeatherView.setupDailyWeather(by: dailyData)
            setBackGround()
            setupWeatherUI()
        }
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            weatherScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            weatherScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            weatherScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            weatherScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            scrollUIStackView.leadingAnchor.constraint(equalTo: self.weatherScrollView.leadingAnchor),
            scrollUIStackView.trailingAnchor.constraint(equalTo: self.weatherScrollView.trailingAnchor),
            scrollUIStackView.widthAnchor.constraint(equalTo: weatherScrollView.widthAnchor, multiplier: 1.0),
            scrollUIStackView.heightAnchor.constraint(equalTo: weatherScrollView.contentLayoutGuide.heightAnchor),

            weatherView.leadingAnchor.constraint(equalTo: self.scrollUIStackView.leadingAnchor),
            weatherView.topAnchor.constraint(equalTo: scrollUIStackView.topAnchor),
            weatherView.trailingAnchor.constraint(equalTo: self.scrollUIStackView.trailingAnchor),
            weatherView.heightAnchor.constraint(equalToConstant: weatherViewScreenHeight),

            collectionBackView.leadingAnchor.constraint(equalTo: self.scrollUIStackView.leadingAnchor),
            collectionBackView.trailingAnchor.constraint(equalTo: self.scrollUIStackView.trailingAnchor),
            collectionBackView.topAnchor.constraint(equalTo: self.weatherView.bottomAnchor, constant: 20),
            collectionBackView.heightAnchor.constraint(equalToConstant: 80),
            
            collectionBackBlurView.leadingAnchor.constraint(equalTo: self.collectionBackView.leadingAnchor),
            collectionBackBlurView.topAnchor.constraint(equalTo: self.collectionBackView.topAnchor),
            collectionBackBlurView.trailingAnchor.constraint(equalTo: self.collectionBackView.trailingAnchor),
            collectionBackBlurView.heightAnchor.constraint(equalToConstant: 80),
  
            collectionView.leadingAnchor.constraint(equalTo: self.collectionBackBlurView.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.collectionBackBlurView.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.collectionBackBlurView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.collectionBackBlurView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 80),
            
            dailyWeatherView.leadingAnchor.constraint(equalTo: self.scrollUIStackView.leadingAnchor),
            dailyWeatherView.topAnchor.constraint(equalTo: self.collectionBackView.bottomAnchor, constant: 20),
            dailyWeatherView.trailingAnchor.constraint(equalTo: self.scrollUIStackView.trailingAnchor),
        ])
        
        if(addNewCityView) {
            weatherView.addNewCity = true
            scrollUIStackView.topAnchor.constraint(equalTo: self.weatherScrollView.topAnchor, constant: 10).isActive = true
            if(!checkDuplication()) {
                cityListAddButton.topAnchor.constraint(equalTo: self.dailyWeatherView.bottomAnchor, constant: 3 ).isActive = true
                cityListAddButton.trailingAnchor.constraint(equalTo: self.weatherScrollView.trailingAnchor, constant: -20).isActive = true
            }
        }
    }
    
    func setupWeatherUI() {
        self.view.addSubview(self.weatherScrollView)
        self.weatherScrollView.addSubview(self.scrollUIStackView)
        self.scrollUIStackView.addArrangedSubview(self.weatherView)
        self.scrollUIStackView.addArrangedSubview(self.collectionBackView)
        self.collectionBackView.addSubview(self.collectionBackBlurView)
        self.collectionBackBlurView.frame = self.collectionBackView.frame
        self.collectionBackBlurView.contentView.addSubview(self.collectionView)
        self.scrollUIStackView.addArrangedSubview(self.dailyWeatherView)
        if(addNewCityView) {
            if(!checkDuplication()){
                self.view.addSubview(self.cityListAddButton)
            }
        }
        setupConstraint()
    }
}

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data = hourlyWeatherData else { return 0}
        return data.hourlyInformation.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyWeatherCollectionViewCell.reuseIdentifier, for: indexPath) as! HourlyWeatherCollectionViewCell
        guard let data = hourlyWeatherData else { return cell}
        cell.configure(with: data.hourlyInformation[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 50, height: 70)
    }
}
