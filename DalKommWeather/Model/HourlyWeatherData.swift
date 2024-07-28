//
//  HourlyWeatherData.swift
//  Weather
//
//  Created by Baek on 2023/12/13.
//

import Foundation

struct HourlyWeatherData: Decodable {
    let temperature: TemperatureModel
    let hourlyInformation: [HourlyWeatherDetailData]
}

extension HourlyWeatherData {
    enum CodingKeys: String, CodingKey {
        case temperature = "summary"
        case hourlyInformation = "items"
    }
}

