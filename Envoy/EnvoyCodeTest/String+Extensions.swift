//
//  String+Extensions.swift
//  EnvoyCodeTest
//
//  Created by Golovanov, Eugene on 2/7/18.
//  Copyright © 2018 Envoy. All rights reserved.
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

