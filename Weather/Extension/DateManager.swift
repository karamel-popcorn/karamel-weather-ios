//
//  DateManager.swift
//  Weather
//
//  Created by Baek on 1/30/24.
//

import Foundation

struct DateManager {
    func formatted(date: Date) -> String {
        let formatterDate = DateFormatter()
        formatterDate.dateStyle = .long
        formatterDate.timeStyle = .none
        formatterDate.locale = Locale.current
        
        return formatterDate.string(from: date)
    }
}
