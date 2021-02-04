//
//  Constants.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import Foundation

class Constants {
    static let countKey = "COUNT_key"
    
    class func apiRoot() -> String {
        return "https://randomuser.me/api/?results=\(Constants.getCount())"
    }
    
    class func getCount() -> Int {
        var value:Int = 5
        if UserDefaults.standard.object(forKey: Constants.countKey) != nil {
            if let v = UserDefaults.standard.object(forKey: Constants.countKey) as? Float {
                value = Int(v)
            }
        }
        return value
    }
    
}

