//
//  DataManage.swift
//  Weather
//
//  Created by Baek on 4/25/24.
//

import Foundation

protocol DataManage {
    func saveWeatherList(item: WeatherListItem)
    func deleteWeatherList(id: UUID)
    func fetchWeatherList() -> [WeatherListItem]?
}
