//
//  hexCodeEnum.swift
//  Weather
//
//  Created by Baek on 2023/07/24.
//

enum HexCodeEnum {
    case karamel
    case sunnyTop
    case sunnyBottom
    case nightTop
    case nightBottom
    case cloudTop
    case cloudBottom
    
    var hexCode: String {
        switch self {
        case.karamel:
            return "F7B479"
        case.sunnyTop:
            return "0075FF"
        case.sunnyBottom:
            return "66C8FF"
        case.nightTop:
            return "06143A"
        case.nightBottom:
            return "4475AE"
        case.cloudTop:
            return "212F3C"
        case.cloudBottom:
            return "5D6D7E"
        }
    }
}
