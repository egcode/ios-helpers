//
//  Global.swift
//  Weather
//
//  Created by Golovanov, Eugene on 4/12/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//


import Foundation

let KEY = "f30d5a9e7f568ca6d9e3688297b7cd8c"

let defaultLattitude: Double = 33.684567
let defaultLongtitude: Double = -117.826505

func getAPIUrl(key: String, lattitude: Double, longtitude: Double, timestamp: Int) -> String {
    return "https://api.darksky.net/forecast/\(key)/\(lattitude),\(longtitude),\(timestamp)?exclude=flags,hourly,currently,alerts,minutely,flags"
}
