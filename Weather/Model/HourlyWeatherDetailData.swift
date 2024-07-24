//
//  HourlyWeatherDetailData.swift
//  Weather
//
//  Created by Baek on 1/26/24.
//

import Foundation

struct HourlyWeatherDetailData: Decodable {
    let dateTime: String
    let temperature: Double
    let humidity: Double
    let windDirection: Double
    let windValue: Double
    let rainProbability: Double
    let sky: String
    let rain: String
    let snow: String
    let storm: String
}

extension HourlyWeatherDetailData {
    enum CodingKeys: String, CodingKey {
        case dateTime = "dateTime"
        case temperature = "temperature"
        case humidity = "humidity"
        case windDirection = "windDirection"
        case windValue = "windValue"
        case rainProbability = "rainProbability"
        case sky = "sky"
        case rain = "rain"
        case snow = "snow"
        case storm = "storm"
    }
}
