//
//  TemperatureModel.swift
//  Weather
//
//  Created by Baek on 2/13/24.
//

import Foundation

struct TemperatureModel: Decodable {
    let minTemperature: Double
    let maxTemperature: Double
}

extension TemperatureModel {
    enum CodingKeys: String, CodingKey {
        case minTemperature = "minTemperature"
        case maxTemperature = "maxTemperature"
    }
}
