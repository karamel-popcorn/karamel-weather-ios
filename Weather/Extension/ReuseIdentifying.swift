//
//  ReuseIdentifying.swift
//  Weather
//
//  Created by Baek on 2/14/24.
//

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
