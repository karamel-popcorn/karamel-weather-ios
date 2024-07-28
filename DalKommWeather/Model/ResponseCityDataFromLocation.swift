//
//  ResponseCityListData.swift
//  Weather
//
//  Created by Baek on 1/10/24.
//

import Foundation

struct ResponseCityDataFromLocation: Decodable {
    let cityInformation: [CityInformation]
}

extension ResponseCityDataFromLocation {
    enum CodingKeys: String, CodingKey {
        case cityInformation = "content"
    }
}

