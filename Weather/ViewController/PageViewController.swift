//
//  PageViewController.swift
//  Weather
//
//  Created by Baek on 7/17/24.
//

import Foundation
import UIKit
import CoreLocation

class PageViewController: UIPageViewController, CLLocationManagerDelegate {
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var locationManager:CLLocationManager?
    private var currentLocation:CLLocationCoordinate2D!
    private let userInfo = UserInfo.shared
    private let dataManager = WeatherListDataManager.shared
    
    
    var weatherList:[UIViewController] = []
    private var pageControl = UIPageControl()
    private var nextButton =  UIButton()
    
    let cityListViewButton: ButtonTouchSizeUp = {
        let button = ButtonTouchSizeUp()
        let config = UIImage.SymbolConfiguration(pointSize: 20,weight:.regular ,scale: .default)
        let image = UIImage(systemName: "list.dash", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    // MARK: - SetUp
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(refreshWeatherList(_:)),
                                               name: NSNotification.Name("refreshWeatherList"),
                                               object: nil)
        
        self.dataSource = self
        self.delegate = self
        
        
        requestAuthorization()
        setWeatherView()
        
        if let firstPage = weatherList.first {
            setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
        setupPageControl()
        setupCityListButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc private func refreshWeatherList(_ notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.weatherList.removeAll()
            self.setWeatherView()
            let selectedIndex = notification.userInfo?["selectedIndex"] as? Int ?? 0
            
            if selectedIndex < self.weatherList.count {
                self.setViewControllers([self.weatherList[selectedIndex]], direction: .forward, animated: false, completion: nil)
            }
            
            self.pageControl.numberOfPages = self.weatherList.count
            self.pageControl.currentPage = selectedIndex
            
            self.dataSource?.pageViewController(self, viewControllerBefore: self.weatherList[selectedIndex])
            self.dataSource?.pageViewController(self, viewControllerAfter: self.weatherList[selectedIndex])
            
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
    
    
    //MARK: - LocationSetting
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
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            guard let coordinate = locationManager!.location?.coordinate else { return }
            
            userInfo.nowLocationLatitude = coordinate.latitude
            userInfo.nowLocationLongitude = coordinate.longitude
        }
    }
    
    func setWeatherView() {
        let pageCount = getPageCount()
        guard let weatherSaveList = dataManager.fetchWeatherList() else { return }
        
        for weatherLists in 0...pageCount {
            let weatherViewController = WeatherViewController()
            if(weatherLists == 0) {
                weatherViewController.nowCitySet = true
                weatherViewController.locationLatitude = userInfo.nowLocationLatitude
                weatherViewController.locationLongitude = userInfo.nowLocationLongitude
                weatherList.append(weatherViewController)
                continue
            }
            weatherViewController.locationLatitude = weatherSaveList[weatherLists-1].latitude
            weatherViewController.locationLongitude = weatherSaveList[weatherLists-1].longitude
            weatherViewController.cityName = weatherSaveList[weatherLists-1].cityName
            weatherViewController.cityNumber = weatherSaveList[weatherLists-1].cityNumber
            weatherList.append(weatherViewController)
        }
    }
    
    func getPageCount() -> Int {
        guard let weatherListItems = dataManager.fetchWeatherList() else {
            return 0
        }
        
        return weatherListItems.count
    }
    
    // MARK: - PageControl
    private func setupPageControl() {
        pageControl = UIPageControl()
        pageControl.numberOfPages = weatherList.count
        pageControl.currentPage = 0
        pageControl.setIndicatorImage(UIImage(systemName: "location.fill"), forPage: 0)
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -15),
            pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    private func updatePageControlAndButton() {
        guard let currentViewController = viewControllers?.first,
              let currentIndex = weatherList.firstIndex(of: currentViewController) else {
            return
        }
        
        pageControl.currentPage = currentIndex
    }
    
    private func setupCityListButton() {
        cityListViewButton.addTarget(self, action: #selector(setTabbar), for: .touchUpInside)
        view.addSubview(cityListViewButton)
        cityListViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityListViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cityListViewButton.centerYAnchor.constraint(equalTo: pageControl.centerYAnchor),
            cityListViewButton.widthAnchor.constraint(equalToConstant: 44),
            cityListViewButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func setTabbar() {
        let weatherListViewCon = WeatherListViewController()
        weatherListViewCon.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(weatherListViewCon, animated: true, completion: nil)
    }
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = weatherList.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        return weatherList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = weatherList.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < weatherList.count else {
            return nil
        }
        
        return weatherList[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            updatePageControlAndButton()
        }
    }
}
