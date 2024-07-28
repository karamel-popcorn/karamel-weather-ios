//
//  DailyWeatherData.swift
//  Weather
//
//  Created by Baek on 2/29/24.
//

import Foundation

struct DailyWeatherData: Decodable {
    let dailyInformation: [DailyWeatherDetailData]
}

extension DailyWeatherData {
    enum CodingKeys: String, CodingKey {
        case dailyInformation = "items"
    }
}
