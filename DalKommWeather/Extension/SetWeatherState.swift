//
//  SetWeatherState.swift
//  Weather
//
//  Created by Baek on 2/29/24.
//

import Foundation

struct SetWeatherState {
    func getWeatherState(by weatherState: String) -> String {
        switch weatherState {
        case "snowcloud":
            return "눈구름"
        case "raini":
            return "비"
        case "snow":
            return "눈"
        case "sunny":
            return "맑음"
        case "suncloud":
            return "구름조금"
        case "cloud":
            return "흐림"
        default:
            return ""
        }
    }
    
    func getWeatherListState(by weatherData: HourlyWeatherDetailData) -> String{
        let checkNone = "NONE"
        let cloudy = weatherData.sky.lowercased()
        
        if(weatherData.rain != checkNone && weatherData.snow != checkNone) {
            return "눈구름"
        }
        
        if(weatherData.storm != checkNone) {
            return "낙뢰"
        }
        
        if(weatherData.rain != checkNone) {
            return "비"
        }
        
        if(weatherData.snow != checkNone) {
            return "눈"
        }
        
        switch cloudy {
        case "clean":
            return "맑음"
        case "cloudy":
            return "구름조금"
        case "dark":
            return "흐림"
        default:
            return ""
        }
    }
}
