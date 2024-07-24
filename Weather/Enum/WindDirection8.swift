//
//  WindDirection.swift
//  Weather
//
//  Created by Baek on 3/3/24.
//

import Foundation

enum WindDirection8 {
    case north
    case northEast
    case east
    case southEast
    case south
    case southWest
    case west
    case northWest

    var name: String {
        switch self {
        case.north:
            return "북풍"
        case.northEast:
            return "북동풍"
        case.east:
            return "동풍"
        case.southEast:
            return "남동풍"
        case.south:
            return "남풍"
        case.southWest:
            return "남서풍"
        case.west:
            return "서풍"
        case.northWest:
            return "북서풍"
        }
    }
    
    static func from(value: Double) -> WindDirection8 {
        let directionNumber = ((value + 22.5) / 45).rounded(FloatingPointRoundingRule.towardZero);
        switch directionNumber {
        case 0:
            return WindDirection8.north
        case 1:
            return WindDirection8.northEast
        case 2:
            return WindDirection8.east
        case 3:
            return WindDirection8.southEast
        case 4:
            return WindDirection8.south
        case 5:
            return WindDirection8.southWest
        case 6:
            return WindDirection8.west
        case 7:
            return WindDirection8.northWest
        default:
            return WindDirection8.north
        }
    }
}
