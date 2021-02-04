//
//  String+Extensions.swift
//  WM
//
//  Created by Golovanov, Eugene on 2/26/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import Foundation

public extension String {
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func isURL() -> Bool {
        return self.lowercased().hasPrefix("http://") || self.lowercased().hasPrefix("https://")
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }

}

