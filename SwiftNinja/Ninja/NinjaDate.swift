//
//  NinjaDate.swift
//  SwiftNinja
//
//  Created by Agus Cahyono on 04/07/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import Foundation
import UIKit

enum DateFormat: String {
    case full = "dd MMMM yyyy" // this will shown the date like: 03 August 1992
    case date = "dd" // only show dates : 03
    case month = "MMM" // Only show month name, like: August
    case dashed = "dd-MM-yyyy" // show date with dashed separator, like: 03-08-1992
    case slashed = "dd/MM/yyyy" // show date with slash, like: 03/08/1992
    case dashedYear = "yyyy-MM-dd" // show date with year first and separator by dash, like: 1992-08-03
    case shortMonth = "dd MMM yyyy" // show date month separator by space, like: 03 08 1992
    case withDay = "EEEE, d MMMM yyyy" // show date with day, like, Monday, 13 August 1992
    case onlyHoursMinute = "HH:mm" // show only hours and minutes, like: 12:00
    case dashWithHour = "dd-MM-yyyy hh:mm" // show date with hour, like: 03-08-1992 12:00
}


open class NinjaDate {
    
    static let shared = NinjaDate()
    
    // MARK: -- Convert string timestamp to only time (hour & minute)
    ///
    /// - Parameter original: timestamp string format
    /// - Returns: return hour and minute
    func convertTimeFormat(original: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: original)
        
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date!)
    }
    
    
    // MARK: -- Convert String date to Date() format
    ///
    /// - Parameter original: date string format
    /// - Returns: return Date() format
    func convertDateFormat(timeStamp: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: timeStamp)
        return date!
    }
    
    // MARK: -- convert date format Date() to string format
    ///
    /// - Parameters:
    ///   - date: date format Date()
    ///   - format: format do you want
    /// - Returns: return new date with string formatted
    func convertNSDateToString(date: Date, format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        
        let idLocale = Locale(identifier: "id_ID")
        dateFormatter.locale = idLocale as Locale?
        
        return dateFormatter.string(from: date as Date)
    }
    
    
    // MARK: -- Convert date with string format to string too
    ///
    /// - Parameters:
    ///   - date: date string
    ///   - format: format do you want to show
    /// - Returns: return new date string formatted
    func convertDateStringToString(date: String, format: DateFormat) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        guard let dateObject1 = dateFormatter.date(from: date) else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            guard let dateObject2 = dateFormatter.date(from: date) else {
                return ""
            }
            return convertNSDateToString(date: dateObject2, format: format)
        }
        return convertNSDateToString(date: dateObject1, format: format)
    }
    
}
