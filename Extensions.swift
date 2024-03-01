//
//  Extensions.swift
//  MySoberDate
//
//  Created by Wylan L Neely on 2/26/24.
//

import Foundation
import UIKit



extension Calendar {
    
    func numberOfDaysBetween(from: Date, to: Date) -> Int {
        let numberOfDays = dateComponents([.day], from: from, to: to)
        return numberOfDays.day!
    }
    
}

extension Date {

    var onlyDate: Date? {
        get {
            let calender = Calendar.current
            var dateComponents = calender.dateComponents([.year, .month, .day], from: self)
            dateComponents.timeZone = NSTimeZone.system
            return calender.date(from: dateComponents)
        }
    }

}
