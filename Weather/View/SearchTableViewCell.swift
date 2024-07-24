//
//  SearchTableViewCell.swift
//  Weather
//
//  Created by Baek on 4/4/24.
//

import UIKit
import Foundation

class SearchTableViewCell: UITableViewCell {
    static let identifier = "SearchTableViewCell"
    
    // MARK: - Properties
    let countryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupAutoLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            if selected {
                self.backgroundColor = .init(white: 1.0, alpha: 0.1)
            } else {
                self.backgroundColor = .none
            }
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    func setupAutoLayout() {
        self.addSubview(countryLabel)
            
        NSLayoutConstraint.activate([
            countryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            countryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            countryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
        ])
           
    }
}
