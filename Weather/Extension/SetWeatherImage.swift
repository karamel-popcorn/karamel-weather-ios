//
//  SetWeatherImage.swift
//  Weather
//
//  Created by Baek on 2/23/24.
//

import Foundation

struct SetWeatherImage {
    func getNowWeatherImage(by weather: HourlyWeatherDetailData) -> String {
        let checkNone = "NONE"
        var cloudy = ""
        
        switch weather.sky {
        case "CLEAN":
            cloudy = "clean"
        case "CLOUDY":
            cloudy = "cloudy"
        case "DARK":
            cloudy = "dark"
        default:
            cloudy = "none"
        }
        
        //눈비
        if(weather.rain != checkNone && weather.snow != checkNone) {
            return "snowcloud"
        }
        
        // 번개
        if(weather.storm != checkNone) {
            return "storm"
        }
        
        //비
        if(weather.rain != checkNone) {
            return "raini"
        } 
        
        //눈
        if(weather.snow != checkNone) {
            return "snow"
        }
        
        //맑음
        if(getNowNightAndDay()) {
            switch cloudy {
            case "clean":
                return "night"
            case "cloudy":
                return "nightcloud"
            case "dark":
                return "cloud"
            default:
                return ""
            }
        } 
        
        switch cloudy {
        case "clean":
            return "sunny"
        case "cloudy":
            return "suncloud"
        case "dark":
            return "cloud"
        default:
            return ""
        }
    }
        
    
    private func getNowNightAndDay() -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let currentTime = Int(formatter.string(from: Date()))!
        
        if(0 <= currentTime && currentTime <= 7 || currentTime >= 19) {
            return true
        } else {
            return false
        }
    }
    
    private func getHourlyNightAndDay(by time: String) -> Bool {
        guard let hourlyTime = Int(time) else  { return false }
        if(0 <= hourlyTime && hourlyTime <= 7 || hourlyTime >= 19) {
            return true
        } else {
            return false
        }
    }
    
    func getHourlyWeatherImage(by weather: HourlyWeatherDetailData, time: String) -> String {
        let checkNone = "NONE"
        let cloudy = weather.sky.lowercased()
        
        if(weather.rain != checkNone && weather.snow != checkNone) {
            return "snowcloud"
        }
        
        // 번개
        if(weather.storm != checkNone) {
            return "storm"
        }
        
        //비
        if(weather.rain != checkNone) {
            return "raini"
        }
        
        //눈
        if(weather.snow != checkNone) {
            return "snow"
        }
        
        //맑음
        if(getHourlyNightAndDay(by: time)) {
            switch cloudy {
            case "clean":
                return "night"
            case "cloudy":
                return "nightcloud"
            case "dark":
                return "cloud"
            default:
                return ""
            }
        }
        
        switch cloudy {
        case "clean":
            return "sunny"
        case "cloudy":
            return "suncloud"
        case "dark":
            return "cloud"
        default:
            return ""
        }
    }
    
    func getWeatherListImage(by weather: HourlyWeatherDetailData) -> String {
        let checkNone = "NONE"
        let cloudy = weather.sky.lowercased()
        
        if(weather.rain != checkNone && weather.snow != checkNone) {
            return "snowcloud"
        }
        
        // 번개
        if(weather.storm != checkNone) {
            return "storm"
        }
        
        //비
        if(weather.rain != checkNone) {
            return "raini"
        }
        
        //눈
        if(weather.snow != checkNone) {
            return "snow"
        }
        
        //맑음
        switch cloudy {
        case "clean":
            return "sunny"
        case "cloudy":
            return "suncloud"
        case "dark":
            return "cloud"
        default:
            return ""
        }
    }
    
    func getDailyWeatherImage(by weather: DailyWeatherDetailData) -> String {
        var imageName = ""
        let checkNone = "NONE"
        
        let cloudy = weather.sky.lowercased()
        
        if(weather.rain != checkNone && weather.snow != checkNone) {
            imageName = "snowcloud"
        } else if(weather.rain != checkNone) {
            imageName = "raini"
        } else if(weather.snow != checkNone) {
            imageName = "snow"
        } else {
            switch cloudy {
            case "clean":
                imageName = "sunny"
            case "cloudy":
                imageName = "suncloud"
            case "dark":
                imageName =  "cloud"
            default:
                imageName = ""
            }
        }
        
        return imageName
    }
}
