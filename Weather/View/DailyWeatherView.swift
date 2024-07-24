//
//  DailyWeatherView.swift
//  Weather
//
//  Created by Baek on 2/28/24.
//

import UIKit

final class DailyWeatherView: UIView {
    private let setWeatherState = SetWeatherState()
    
    private let weekWeatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.backgroundColor = .clear
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    //- MARK: Week Of Day StackView Setting
    
    private let zeroWeekOfDayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let oneWeekOfDayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let twoWeekOfDayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let threeWeekOfDayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let fourWeekOfDayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let fiveWeekOfDayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let sixWeekOfDayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let sevenWeekOfDayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // - MARK: View Day and Date Setting
    
    private let zeroDayOfWeekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private let oneDayOfWeekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private let twoDayOfWeekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private let threeDayOfWeekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private let fourDayOfWeekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private let fiveDayOfWeekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private let sixDayOfWeekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private let sevenDayOfWeekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    // - MARK: Label Setting
    
    private let zeroDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let oneDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let twoDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let threeDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let fourDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let fiveDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let sixDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let sevenDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    // - MARK: View Date Setting
    
    private let zeroDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let oneDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let twoDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let threeDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let fourDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let fiveDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let sixDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let sevenDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    // - MARK: View Image Setting
    
    private let zeroDayWeatherImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let oneDayWeatherImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let twoDayWeatherImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let threeDayWeatherImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let fourDayWeatherImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let fiveDayWeatherImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let sixDayWeatherImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let sevenDayWeatherImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // - MARK: View weatherState Setting
    
    private let zeroWeatherStateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let oneWeatherStateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let twoWeatherStateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let threeWeatherStateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let fourWeatherStateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let fiveWeatherStateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let sixWeatherStateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let sevenWeatherStateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    // - MARK: View lowTemperature Setting
    
    private let zeroLowTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let oneLowTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let twoLowTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let threeLowTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let fourLowTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let fiveLowTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let sixLowTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let sevenLowTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    // - MARK: View highTemperature Setting
    
    private let zeroHighTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let oneHighTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let twoHighTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let threeHighTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let fourHighTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let fiveHighTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let sixHighTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let sevenHighTemperature: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    private let setWeatherImage = SetWeatherImage()
    
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

extension DailyWeatherView {
    private func commonInit() {
        addSubView()
        setupConstraint()
    }
    
    // - MARK: AddSubView
    private func addSubView() {
        self.addSubview(weekWeatherStackView)
        
        weekWeatherStackView.addArrangedSubview(zeroWeekOfDayStackView)
        weekWeatherStackView.addArrangedSubview(oneWeekOfDayStackView)
        weekWeatherStackView.addArrangedSubview(twoWeekOfDayStackView)
        weekWeatherStackView.addArrangedSubview(threeWeekOfDayStackView)
        weekWeatherStackView.addArrangedSubview(fourWeekOfDayStackView)
        weekWeatherStackView.addArrangedSubview(fiveWeekOfDayStackView)
        weekWeatherStackView.addArrangedSubview(sixWeekOfDayStackView)
        weekWeatherStackView.addArrangedSubview(sevenWeekOfDayStackView)
        
        zeroWeekOfDayStackView.addArrangedSubview(zeroDayOfWeekStackView)
        zeroDayOfWeekStackView.addArrangedSubview(zeroDayLabel)
        zeroDayOfWeekStackView.addArrangedSubview(zeroDateLabel)
        zeroWeekOfDayStackView.addArrangedSubview(zeroDayWeatherImage)
        zeroWeekOfDayStackView.addArrangedSubview(zeroWeatherStateLabel)
        zeroWeekOfDayStackView.addArrangedSubview(zeroLowTemperature)
        zeroWeekOfDayStackView.addArrangedSubview(zeroHighTemperature)
        
        oneWeekOfDayStackView.addArrangedSubview(oneDayOfWeekStackView)
        oneDayOfWeekStackView.addArrangedSubview(oneDayLabel)
        oneDayOfWeekStackView.addArrangedSubview(oneDateLabel)
        oneWeekOfDayStackView.addArrangedSubview(oneDayWeatherImage)
        oneWeekOfDayStackView.addArrangedSubview(oneWeatherStateLabel)
        oneWeekOfDayStackView.addArrangedSubview(oneLowTemperature)
        oneWeekOfDayStackView.addArrangedSubview(oneHighTemperature)
        
        twoWeekOfDayStackView.addArrangedSubview(twoDayOfWeekStackView)
        twoDayOfWeekStackView.addArrangedSubview(twoDayLabel)
        twoDayOfWeekStackView.addArrangedSubview(twoDateLabel)
        twoWeekOfDayStackView.addArrangedSubview(twoDayWeatherImage)
        twoWeekOfDayStackView.addArrangedSubview(twoWeatherStateLabel)
        twoWeekOfDayStackView.addArrangedSubview(twoLowTemperature)
        twoWeekOfDayStackView.addArrangedSubview(twoHighTemperature)
        
        threeWeekOfDayStackView.addArrangedSubview(threeDayOfWeekStackView)
        threeDayOfWeekStackView.addArrangedSubview(threeDayLabel)
        threeDayOfWeekStackView.addArrangedSubview(threeDateLabel)
        threeWeekOfDayStackView.addArrangedSubview(threeDayWeatherImage)
        threeWeekOfDayStackView.addArrangedSubview(threeWeatherStateLabel)
        threeWeekOfDayStackView.addArrangedSubview(threeLowTemperature)
        threeWeekOfDayStackView.addArrangedSubview(threeHighTemperature)
        
        fourWeekOfDayStackView.addArrangedSubview(fourDayOfWeekStackView)
        fourDayOfWeekStackView.addArrangedSubview(fourDayLabel)
        fourDayOfWeekStackView.addArrangedSubview(fourDateLabel)
        fourWeekOfDayStackView.addArrangedSubview(fourDayWeatherImage)
        fourWeekOfDayStackView.addArrangedSubview(fourWeatherStateLabel)
        fourWeekOfDayStackView.addArrangedSubview(fourLowTemperature)
        fourWeekOfDayStackView.addArrangedSubview(fourHighTemperature)
        
        fiveWeekOfDayStackView.addArrangedSubview(fiveDayOfWeekStackView)
        fiveDayOfWeekStackView.addArrangedSubview(fiveDayLabel)
        fiveDayOfWeekStackView.addArrangedSubview(fiveDateLabel)
        fiveWeekOfDayStackView.addArrangedSubview(fiveDayWeatherImage)
        fiveWeekOfDayStackView.addArrangedSubview(fiveWeatherStateLabel)
        fiveWeekOfDayStackView.addArrangedSubview(fiveLowTemperature)
        fiveWeekOfDayStackView.addArrangedSubview(fiveHighTemperature)
        
        sixWeekOfDayStackView.addArrangedSubview(sixDayOfWeekStackView)
        sixDayOfWeekStackView.addArrangedSubview(sixDayLabel)
        sixDayOfWeekStackView.addArrangedSubview(sixDateLabel)
        sixWeekOfDayStackView.addArrangedSubview(sixDayWeatherImage)
        sixWeekOfDayStackView.addArrangedSubview(sixWeatherStateLabel)
        sixWeekOfDayStackView.addArrangedSubview(sixLowTemperature)
        sixWeekOfDayStackView.addArrangedSubview(sixHighTemperature)
        
        
        sevenWeekOfDayStackView.addArrangedSubview(sevenDayOfWeekStackView)
        sevenDayOfWeekStackView.addArrangedSubview(sevenDayLabel)
        sevenDayOfWeekStackView.addArrangedSubview(sevenDateLabel)
        sevenWeekOfDayStackView.addArrangedSubview(sevenDayWeatherImage)
        sevenWeekOfDayStackView.addArrangedSubview(sevenWeatherStateLabel)
        sevenWeekOfDayStackView.addArrangedSubview(sevenLowTemperature)
        sevenWeekOfDayStackView.addArrangedSubview(sevenHighTemperature)
    
    }
    
    // - MARK: SetUpConstraint
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            weekWeatherStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            weekWeatherStackView.topAnchor.constraint(equalTo: self.topAnchor),
            weekWeatherStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            weekWeatherStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            zeroDayWeatherImage.heightAnchor.constraint(equalToConstant: 30),
            twoDayWeatherImage.heightAnchor.constraint(equalToConstant: 30),
            threeDayWeatherImage.heightAnchor.constraint(equalToConstant: 30),
            fourDayWeatherImage.heightAnchor.constraint(equalToConstant: 30),
            fiveDayWeatherImage.heightAnchor.constraint(equalToConstant: 30),
            sixDayWeatherImage.heightAnchor.constraint(equalToConstant: 30),
            sevenDayWeatherImage.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    func setupDailyWeather(by data: DailyWeatherData) {
        zeroDayLabel.text = getDayOfWeek(date: data.dailyInformation[0].dateTime)
        zeroDateLabel.text = getDate(with: data.dailyInformation[0].dateTime)
        let zeroimageName = setWeatherImage.getDailyWeatherImage(by: data.dailyInformation[0])
        zeroDayWeatherImage.image = UIImage(named: zeroimageName)
        zeroWeatherStateLabel.text = setWeatherState.getWeatherState(by: zeroimageName)
        zeroLowTemperature.text = "최저"+String(data.dailyInformation[0].minTemperature)+"°"
        zeroHighTemperature.text = "최고"+String(data.dailyInformation[0].maxTemperature)+"°"
        
        oneDayLabel.text = getDayOfWeek(date: data.dailyInformation[2].dateTime)
        oneDateLabel.text = getDate(with: data.dailyInformation[2].dateTime)
        let oneimageName = setWeatherImage.getDailyWeatherImage(by: data.dailyInformation[2])
        oneDayWeatherImage.image = UIImage(named: oneimageName)
        oneWeatherStateLabel.text = setWeatherState.getWeatherState(by: oneimageName)
        oneLowTemperature.text = "최저"+String(data.dailyInformation[2].minTemperature)+"°"
        oneHighTemperature.text = "최고"+String(data.dailyInformation[2].maxTemperature)+"°"
        
        twoDayLabel.text = getDayOfWeek(date: data.dailyInformation[4].dateTime)
        twoDateLabel.text = getDate(with: data.dailyInformation[4].dateTime)
        let twoimageName = setWeatherImage.getDailyWeatherImage(by: data.dailyInformation[4])
        twoDayWeatherImage.image = UIImage(named: twoimageName)
        twoWeatherStateLabel.text = setWeatherState.getWeatherState(by: twoimageName)
        twoLowTemperature.text = "최저"+String(data.dailyInformation[4].minTemperature)+"°"
        twoHighTemperature.text = "최고"+String(data.dailyInformation[4].maxTemperature)+"°"
        
        threeDayLabel.text = getDayOfWeek(date: data.dailyInformation[6].dateTime)
        threeDateLabel.text = getDate(with: data.dailyInformation[6].dateTime)
        let threeimageName = setWeatherImage.getDailyWeatherImage(by: data.dailyInformation[6])
        threeDayWeatherImage.image = UIImage(named: threeimageName)
        threeWeatherStateLabel.text = setWeatherState.getWeatherState(by: threeimageName)
        threeLowTemperature.text = "최저"+String(data.dailyInformation[6].minTemperature)+"°"
        threeHighTemperature.text = "최고"+String(data.dailyInformation[6].maxTemperature)+"°"
        
        fourDayLabel.text = getDayOfWeek(date: data.dailyInformation[8].dateTime)
        fourDateLabel.text = getDate(with: data.dailyInformation[8].dateTime)
        let fourimageName = setWeatherImage.getDailyWeatherImage(by: data.dailyInformation[8])
        fourDayWeatherImage.image = UIImage(named: fourimageName)
        fourWeatherStateLabel.text = setWeatherState.getWeatherState(by: fourimageName)
        fourLowTemperature.text = "최저"+String(data.dailyInformation[8].minTemperature)+"°"
        fourHighTemperature.text = "최고"+String(data.dailyInformation[8].maxTemperature)+"°"
        
        fiveDayLabel.text = getDayOfWeek(date: data.dailyInformation[10].dateTime)
        fiveDateLabel.text = getDate(with: data.dailyInformation[10].dateTime)
        let fiveimageName = setWeatherImage.getDailyWeatherImage(by: data.dailyInformation[10])
        fiveDayWeatherImage.image = UIImage(named: fiveimageName)
        fiveWeatherStateLabel.text = setWeatherState.getWeatherState(by: fiveimageName)
        fiveLowTemperature.text = "최저"+String(data.dailyInformation[10].minTemperature)+"°"
        fiveHighTemperature.text = "최고"+String(data.dailyInformation[10].maxTemperature)+"°"
        
        sixDayLabel.text = getDayOfWeek(date: data.dailyInformation[11].dateTime)
        sixDateLabel.text = getDate(with: data.dailyInformation[11].dateTime)
        let siximageName = setWeatherImage.getDailyWeatherImage(by: data.dailyInformation[11])
        sixDayWeatherImage.image = UIImage(named: siximageName)
        sixWeatherStateLabel.text = setWeatherState.getWeatherState(by: siximageName)
        sixLowTemperature.text = "최저"+String(data.dailyInformation[11].minTemperature)+"°"
        sixHighTemperature.text = "최고"+String(data.dailyInformation[11].maxTemperature)+"°"
        
        sevenDayLabel.text = getDayOfWeek(date: data.dailyInformation[12].dateTime)
        sevenDateLabel.text = getDate(with: data.dailyInformation[12].dateTime)
        let sevenimageName = setWeatherImage.getDailyWeatherImage(by: data.dailyInformation[12])
        sevenDayWeatherImage.image = UIImage(named: sevenimageName)
        sevenWeatherStateLabel.text = setWeatherState.getWeatherState(by: sevenimageName)
        sevenLowTemperature.text = "최저"+String(data.dailyInformation[12].minTemperature)+"°"
        sevenHighTemperature.text = "최고"+String(data.dailyInformation[12].maxTemperature)+"°"
        
    }
    
    private func getDayOfWeek(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formatTime = dateFormatter.date(from: date)!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEEEE"
        formatter.locale = Locale(identifier:"ko_KR")
        let convertStr = formatter.string(from: formatTime)
        return convertStr
    }
    
    private func getDate(with time: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formatTime = dateFormatter.date(from: time)!
        
        let dateFormatterStrirng = DateFormatter()
        dateFormatterStrirng.dateFormat = "MM/dd"
        let lastTime = dateFormatterStrirng.string(from:formatTime)
        return lastTime
    }

}
