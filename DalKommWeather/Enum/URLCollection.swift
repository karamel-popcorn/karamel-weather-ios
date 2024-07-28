//
//  URLCollection.swift
//  Weather
//
//  Created by Baek on 2023/12/07.
//

import Foundation

enum URLCollection {
    static let getUserLocationURL = "https://karamelpopcorn.com/api/v1/locations?"
    static let getUserWeatherURL = "https://karamelpopcorn.com/api/v1/locations/"
}

enum HTTPMethod {
    static let post = "POST"
    static let put = "PUT"
    static let get = "GET"
    static let delete = "DELETE"
}
