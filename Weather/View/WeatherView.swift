//
//  WeatherView.swift
//  Weather
//
//  Created by Baek on 2023/09/15.
//

import UIKit

final class WeatherView: UIView {
    let setWeatherImage = SetWeatherImage()
    var addNewCity = false
    
    // - MARK: Main Weather View Settings
    
    private let weatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let hourlyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let weeklyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let bottomOptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private let middleOptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private let leftOptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private let highestLowestTemperature: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private let cityListButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 12,weight:.regular ,scale: .default)
        let image = UIImage(systemName: "location.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let temperatureLabel: UILabel = {
        let bounds = UIScreen.main.bounds
        let width = bounds.width
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: width/6)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let lowestTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let highestTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let weatherImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let rainProbabilityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let windDirectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    // - MARK: View Normal Setting
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}

extension WeatherView {
    private func commonInit() {
        addSubView()
        setupConstraint()
    }
    
    func configureNowLocationData(at data: ResponseCityDataFromLocation) {
        guard let location = data.cityInformation.first?.cityName else { return }
        var cityListName = ""
        if(location.count > 1 && !addNewCity){
            for locationCount in 0..<location.count {
                cityListName += location[locationCount] + " "
            }
            cityListButton.setTitle(cityListName, for: .normal)
            return
        }
        cityListButton.setTitle(location[0], for: .normal)
    }
    
    func configureNowWeatherData(at data: HourlyWeatherData) {
        
        guard let weatherData = data.hourlyInformation.first else { return }
        let windDirectionData = WindDirection8.from(value: weatherData.windDirection)
        let imageName = self.setWeatherImage.getNowWeatherImage(by: weatherData)
        weatherImage.image = UIImage(named: imageName)
        
        lowestTemperatureLabel.text =
        "최저 "+String(data.temperature.minTemperature)+"°"
        highestTemperatureLabel.text =
        "최고 "+String(data.temperature.maxTemperature)+"°"
        
        temperatureLabel.text =
        String(weatherData.temperature)+"°"
        humidityLabel.text =
        "습도 "+String(weatherData.humidity)+"%"
        rainProbabilityLabel.text =
        "강수확률 "+String(weatherData.rainProbability)+"%"
        windDirectionLabel.text =
        windDirectionData.name+String(weatherData.windValue)+"m/s"
    }
    
    // - MARK: Setting Constraint
    
    private func addSubView() {
        self.addSubview(weatherStackView)
        
        // - MARK: Add Main Weather
        weatherStackView.addArrangedSubview(middleOptionStackView)
        weatherStackView.addArrangedSubview(bottomOptionStackView)
        
        middleOptionStackView.addArrangedSubview(leftOptionStackView)
        middleOptionStackView.addArrangedSubview(weatherImage)
        leftOptionStackView.addArrangedSubview(cityListButton)
        leftOptionStackView.addArrangedSubview(temperatureLabel)
        leftOptionStackView.addArrangedSubview(highestLowestTemperature)
        highestLowestTemperature.addArrangedSubview(lowestTemperatureLabel)
        highestLowestTemperature.addArrangedSubview(highestTemperatureLabel)
        
        bottomOptionStackView.addArrangedSubview(humidityLabel)
        bottomOptionStackView.addArrangedSubview(rainProbabilityLabel)
        bottomOptionStackView.addArrangedSubview(windDirectionLabel)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            weatherStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            weatherStackView.topAnchor.constraint(equalTo: self.topAnchor),
            weatherStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            weatherStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
