//
//  UserInfo.swift
//  Weather
//
//  Created by Baek on 5/22/24.
//

import Foundation

class UserInfo {
    static let shared = UserInfo()
    
    var nowLocationLatitude = 0.0
    var nowLocationLongitude = 0.0
    var nowCityName = ""
    var nowCityNumber = 0
    
    private init() { }
}
