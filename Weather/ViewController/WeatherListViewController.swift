//
//  WeatherListViewController.swift
//  Weather
//
//  Created by Baek on 3/21/24.
//

import Foundation
import UIKit
import MapKit

final class WeatherListViewController: UIViewController {
    private let hourlyWeatherAPI = HourlyWeatherAPI()
    private var hourlyWeatherData: HourlyWeatherData?
    private let dataManager = WeatherListDataManager.shared
    private var userHourlyURL = ""
    private var weatherListCreatedDate = 0.0
    var nowLocationLatitude = 0.0
    var nowLocationLongitude = 0.0
    let nowDateFormatter = DateFormatter()
    let nowDate = Date()
    
    private let userInfo = UserInfo.shared
    private let semaphore = DispatchSemaphore(value: 0)
    
    // MARK: - Properties
    private let weatherListTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.rowHeight = 40
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private func getWeatherData(with cityNumber: Int) -> HourlyWeatherData {
        self.nowDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dateString = nowDateFormatter.string(for: self.nowDate)
        userHourlyURL = URLCollection.getUserWeatherURL+"\(String(cityNumber))/weathers/\(dateString!)/hourly"
        hourlyWeatherAPI.dataTask(by: userHourlyURL, completion: { (response) in
            switch response {
            case .success(let data):
                self.hourlyWeatherData = data
            case .failure(let data):
                print(data)
            }
        })
        
        let weatherData = hourlyWeatherData
        return weatherData!
    }
    
    private var weatherListItem: [WeatherListItem] = []
    
    // MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        addSubView()
        setupConstraint()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchWeather(manager: dataManager)
        weatherListTableView.reloadData()
    }
    
    // MARK: - Custom Method
    
    private func configUI() {
        self.view.backgroundColor = UIColor(hexCode: HexCodeEnum.karamel.hexCode)
    }
    
    private func addSubView() {
        self.view.addSubview(weatherListTableView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            weatherListTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            weatherListTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            weatherListTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            weatherListTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func setupTableView() {
        weatherListTableView.delegate = self
        weatherListTableView.dataSource = self
        weatherListTableView.register(WeatherListViewCell.self, forCellReuseIdentifier: "WeatherListViewCell")
        weatherListTableView.separatorStyle = .singleLine
        weatherListTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    }
    
    private func fetchWeather(manager: WeatherListDataManager) {
        guard let weatherListItems = manager.fetchWeatherList() else { return }
        self.weatherListItem = weatherListItems
        let nowCityData = WeatherListItem(id: UUID(), cityNumber: self.userInfo.nowCityNumber, cityName: self.userInfo.nowCityName, createdAt: 0.0, latitude: 0.0, longitude: 0.0)
        weatherListItem.insert(nowCityData, at: 0)
    }
    
    // MARK: - @objc
    
    @objc private func touchUpSearchCityButton(_ sender: UIButton) {
        let weatherSearchListViewCon = SearchViewController()
        weatherSearchListViewCon.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(weatherSearchListViewCon, animated: true, completion: nil)
    }
    
    @objc func touchupWebButton(_ sender: UIButton) {
        let application = UIApplication.shared
        let weatherURL = URL(string: "https://weather.com/ko-KR/weather/today/")!
        if application.canOpenURL(weatherURL) {
            application.open(weatherURL, options: [:], completionHandler: nil)
        }
    }
}

extension WeatherListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row != 0
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if indexPath.row == 0 {
            return nil
        }
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            tableView.beginUpdates()
            WeatherListDataManager.shared.deleteWeatherList(id: self.weatherListItem[indexPath.row].id)
            self.fetchWeather(manager: self.dataManager)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            completionHandler(true)
        }
        action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [action])
    }
}

extension WeatherListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = ListFooterView()
        footerView.webButton.addTarget(self, action: #selector(touchupWebButton(_:)), for: .touchUpInside)
        footerView.searchNewCityButton.addTarget(self, action: #selector(touchUpSearchCityButton(_:)), for: .touchUpInside)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListViewCell", for: indexPath) as? WeatherListViewCell else { return UITableViewCell() }
        
        
        let data = getWeatherData(with: weatherListItem[indexPath.row].cityNumber)
        cell.configure(with: data, name: self.weatherListItem[indexPath.row].cityName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NotificationCenter.default.post(name: NSNotification.Name("refreshWeatherList"), object: nil, userInfo: ["selectedIndex": indexPath.row])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
        
    }
}
