//
//  ResponseData.swift
//  Weather
//
//  Created by Baek on 2023/12/07.
//

struct ResponseData: Decodable {
    let weather: String
}

extension ResponseData {
    enum CodingKeys: String, CodingKey {
        case weather
    }
}
