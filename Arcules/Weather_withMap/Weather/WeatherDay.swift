//
//  WeatherDay.swift
//  Weather
//
//  Created by Golovanov, Eugene on 4/12/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import Foundation

public class WeatherDay: CustomDebugStringConvertible {
    public var timestamp: Int = 0
    public var temperatureMin: Float = 0
    public var temperatureMax: Float = 0
    public var iconName: String = ""
    public var summary: String = ""
    public var humidity: Float = 0
    public var pressure: Float = 0
    public var windspeed: Float = 0
    public var visibility: Float = 0

    var date: Date? {
        if self.timestamp == 0 {
            return nil
        } else {
            return DateHelpers.dateFromTimestamp(timestamp: Int(self.timestamp))
        }
    }
    var dateString: String? {
        if let d = self.date {
            return DateHelpers.dateStringFromDate(date: d)
        } else {
            return nil
        }
    }
    
    public init(data: [String:AnyObject]) {
        self.timestamp = data["time"] as? Int ?? 0
        self.temperatureMin = data["temperatureMin"] as? Float ?? 0
        self.temperatureMax = data["temperatureMax"] as? Float ?? 0
        self.iconName = (data["icon"] as? String ?? "").trim()
        self.summary = (data["summary"] as? String ?? "").trim()
        self.humidity = data["humidity"] as? Float ?? 0
        self.pressure = data["pressure"] as? Float ?? 0
        self.windspeed = data["windSpeed"] as? Float ?? 0
        self.visibility = data["visibility"] as? Float ?? 0
    }
    
    public var debugDescription: String {
        return "\n<\ndateString=\(String(describing: self.dateString)) \niconName=\(self.iconName)  \ntimestamp=\(self.timestamp) \ntemperatureMin=\(self.temperatureMin) \ntemperatureMax=\(self.temperatureMax)\nsummary=\(self.summary) ;\n>"
    }
}
