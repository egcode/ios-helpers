//
//  DateHelpers.swift
//  Weather
//
//  Created by Golovanov, Eugene on 4/12/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import Foundation

class DateHelpers {
    
    /**
     Timestamp
     */
    class func timestampFromDate(date:Date) -> Int {
        return Int(date.timeIntervalSince1970)

    }
    
    class func dateFromTimestamp(timestamp:Int) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
    
    /**
     Date String
     */
    class func dateStringFromDate(date:Date) -> String {
        if NSCalendar.current.isDateInToday(date) {
            return "Today"
        } else if NSCalendar.current.isDateInYesterday(date) {
            return "Yesterday"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
    
    /**
     Date n days ago
     */
    class func daysBackFromNow(days: Int) -> Date? {
        return (Calendar.current as NSCalendar).date(byAdding: .day, value: -days, to: Date(), options: [])
    }

}
