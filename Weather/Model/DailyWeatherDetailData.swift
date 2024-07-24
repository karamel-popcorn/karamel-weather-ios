//
//  DailyWeatherDetailData.swift
//  Weather
//
//  Created by Baek on 2/29/24.
//

import Foundation

struct DailyWeatherDetailData: Decodable {
    let dateTime: String
    let amPm: String
    let minTemperature: Int
    let minTemperatureLow: Int
    let minTemperatureHigh: Int
    let maxTemperature: Int
    let maxTemperatureLow: Int
    let maxTemperatureHigh: Int
    let rainProbability: Int
    let rain: String
    let sky: String
    let snow: String
}

extension DailyWeatherDetailData {
    enum CodingKeys: String, CodingKey {
        case dateTime = "date"
        case amPm = "amPm"
        case minTemperature = "minTemperature"
        case minTemperatureLow = "minTemperatureLow"
        case minTemperatureHigh = "minTemperatureHigh"
        case maxTemperature = "maxTemperature"
        case maxTemperatureLow = "maxTemperatureLow"
        case maxTemperatureHigh = "maxTemperatureHigh"
        case rainProbability = "rainProbability"
        case rain = "rain"
        case sky = "sky"
        case snow = "snow"
    }
}
