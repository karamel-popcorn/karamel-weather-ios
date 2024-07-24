//
//  WeatherListItem.swift
//  Weather
//
//  Created by Baek on 4/20/24.
//

import Foundation

struct WeatherListItem {
    let id: UUID
    let cityNumber: Int
    let cityName: String
    let createdAt: Double
    let latitude: Double
    let longitude: Double
    
    init(id: UUID, cityNumber: Int, cityName: String, createdAt: Double, latitude: Double, longitude: Double) {
        self.id = id
        self.cityNumber = cityNumber
        self.cityName = cityName
        self.createdAt = createdAt
        self.latitude = latitude
        self.longitude = longitude
    }
}
