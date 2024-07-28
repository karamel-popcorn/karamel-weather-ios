//
//  Extension+UICollectionView.swift
//  Weather
//
//  Created by Baek on 2/14/24.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionView>(cellWithClass name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }
}
