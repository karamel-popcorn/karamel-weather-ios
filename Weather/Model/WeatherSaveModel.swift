//
//  WeatherSaveModel.swift
//  Weather
//
//  Created by Baek on 6/3/24.
//

import Foundation

struct WeatherSaveModel {
    let entityName: String
    let sampleData: [String: Any]
    
    public init(entityName: String, sampleData: [String: Any]) {
        self.entityName = entityName
        self.sampleData = sampleData
    }
}
