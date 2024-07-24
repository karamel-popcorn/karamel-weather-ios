//
//  CityInformation.swift
//  Weather
//
//  Created by Baek on 1/18/24.
//

import Foundation

struct CityInformation: Decodable {
    let cityNumber: Int
    let cityName: [String]
}

extension CityInformation {
    enum CodingKeys: String, CodingKey {
        case cityNumber = "id"
        case cityName = "names"
    }
}
