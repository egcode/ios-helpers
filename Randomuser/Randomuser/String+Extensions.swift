//
//  String+Extensions.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import Foundation

public extension String {
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func isURL() -> Bool {
        return self.lowercased().hasPrefix("http://") || self.lowercased().hasPrefix("https://")
    }
    
}
