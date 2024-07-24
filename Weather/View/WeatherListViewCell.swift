//
//  WeatherListViewCell.swift
//  Weather
//
//  Created by Baek on 4/19/24.
//

import UIKit

class WeatherListViewCell: UITableViewCell {
    static let reuseIdentifier = "WeatherListViewCell"
    
    private let setWeatherImage = SetWeatherImage()
    private let setWeatherState = SetWeatherState()
    let getNowWeatherState = ""
    
    private let weatherListStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 2
        return stackView
    }()
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let weatherStateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let weatherImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let lowestTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let highestTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commoninit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layoutMargins = UIEdgeInsets(top: 16.0, left: 16, bottom: 100, right: 16)
    }
    
    override func awakeFromNib() {
           super.awakeFromNib()
           self.backgroundColor = .gray
    }
}

extension WeatherListViewCell {
    private func commoninit() {
        addSubViews()
        setupConstraint()
    }
    
    private func addSubViews() {
        self.addSubview(weatherListStackView)
        weatherListStackView.addArrangedSubview(cityNameLabel)
        weatherListStackView.addArrangedSubview(weatherStateLabel)
        weatherListStackView.addArrangedSubview(weatherImage)
        weatherListStackView.addArrangedSubview(lowestTemperatureLabel)
        weatherListStackView.addArrangedSubview(highestTemperatureLabel)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            weatherListStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            weatherListStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            weatherListStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            weatherListStackView.topAnchor.constraint(equalTo: self.topAnchor),
        ])
    }
    
    func configure(with data: HourlyWeatherData, name: String) {
        guard let detailData = data.hourlyInformation.first else { return }
        cityNameLabel.text = name
        weatherStateLabel.text = setWeatherState.getWeatherListState(by: detailData)
        
        let getNowWeatherState = self.setWeatherImage.getNowWeatherImage(by: detailData)
        weatherImage.image = UIImage(named: getNowWeatherState)
        
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
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [backgroundTopColor,
                                backgroundBottomColor]
        gradientLayer.locations = [0.1, 0.9]
        self.layer.addSublayer(gradientLayer)
        
        lowestTemperatureLabel.text = "최저"+String(data.temperature.minTemperature)+"°"
        highestTemperatureLabel.text = "최고"+String(data.temperature.maxTemperature)+"°"
        commoninit()
    }
}


