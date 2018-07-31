//
//  DateManager.swift
//  HR_helper
//
//  Created by Oleksii Kolomiiets on 7/31/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class DateManager{
    var resultString: String {
        return getString(from: self.date, pattern: self.datePattern)
    }
    private var datePattern: DatePattern
    private var date: Date
    
    init? (date: Date, datePattern: DatePattern) {
        self.date = date
        self.datePattern = datePattern
    }
    
    enum DatePattern {
        case byDefault
        
        var value: String {
            switch self {
            case .byDefault:
                return "MM-dd-yyyy"
            }
        }
    }
    
    private func getString(from date: Date, pattern: DatePattern) -> String {
//        let neededDate = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DatePattern.byDefault.value
        
        let neededDateString = dateFormatter.string(from: date)
        let neededDateByPattern = dateFormatter.date(from: neededDateString)
        dateFormatter.dateFormat = pattern.value
        
        guard let resultingDate: Date = neededDateByPattern else { return "Date error."}
        let formattedDate = dateFormatter.string(from: resultingDate)
        return formattedDate
    }
}


