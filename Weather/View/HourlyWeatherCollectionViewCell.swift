//
//  HourlyWeatherCollectionViewCell.swift
//  Weather
//
//  Created by Baek on 2023/12/13.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "HourlyWeatherCollectionViewCell"
    
    private let setWeatherImage = SetWeatherImage()
    
    private let weatherImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let hourlyTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let timeZoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let hourlyWeatherDetailInfomationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 2
        return stackView
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            commoninit()
        }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
}

extension HourlyWeatherCollectionViewCell {
    private func commoninit() {
        addSubViews()
        setupConstraint()
    }
    
    private func addSubViews() {
        self.addSubview(hourlyWeatherDetailInfomationStackView)
        hourlyWeatherDetailInfomationStackView.addArrangedSubview(weatherImage)
        hourlyWeatherDetailInfomationStackView.addArrangedSubview(textStackView)
        textStackView.addArrangedSubview(hourlyTemperatureLabel)
        textStackView.addArrangedSubview(timeZoneLabel)
        
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            hourlyWeatherDetailInfomationStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hourlyWeatherDetailInfomationStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hourlyWeatherDetailInfomationStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            hourlyWeatherDetailInfomationStackView.topAnchor.constraint(equalTo: self.topAnchor),
        ])
    }
    
    func configure(with data: HourlyWeatherDetailData) {
        let weatherTime = formatHour(with: data.dateTime)
        let imageName = setWeatherImage.getHourlyWeatherImage(by: data, time: weatherTime)
        weatherImage.image = UIImage(named: imageName)
        hourlyTemperatureLabel.text = String(data.temperature)+"°"
        timeZoneLabel.text = weatherTime + "시"
    }
    
    private func formatHour(with time: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let formatTime = dateFormatter.date(from: time)!
        
        let dateFormatterStrirng = DateFormatter()
        dateFormatterStrirng.dateFormat = "HH"
        let lastTime = dateFormatterStrirng.string(from:formatTime)
        return lastTime
    }
}
