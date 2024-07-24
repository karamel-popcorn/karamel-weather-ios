//
//  ListFooterView.swift
//  Weather
//
//  Created by Baek on 4/13/24.
//

import UIKit

class ListFooterView: UIView {
    let webButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 20,weight:.regular ,scale: .default)
        let image = UIImage(systemName: "network", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchNewCityButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 20,weight:.regular ,scale: .default)
        let image = UIImage(systemName: "plus.magnifyingglass", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAutoLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAutoLayout() {
        self.addSubview(webButton)
        self.addSubview(searchNewCityButton)
        
        NSLayoutConstraint.activate([
            webButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            webButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            webButton.heightAnchor.constraint(equalToConstant: 30),
            webButton.widthAnchor.constraint(equalToConstant: 30),
            
            searchNewCityButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            searchNewCityButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
        
}
