//
//  JSON.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import Foundation

//-------------------------------------------------------------------------------
//MARK: - JSON

extension Data {
    var JSONObject: Any? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: [])
        } catch {
            //print("Problem de-serializing object: \(error)")
        }
        
        return nil
    }
}

extension String {
    var JSONObject: Any? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        
        return data.JSONObject
    }
}

extension Dictionary {
    var JSONString: String? {
        guard let data = self.JSONData else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    var JSONData: Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: [])
        } catch {
            //print("Problem de-serializing object: \(error)")
        }
        return nil
    }
}

extension Array {
    var JSONString: String? {
        guard let data = self.JSONData else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    var JSONData: Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: [])
        } catch {
            //print("Problem de-serializing object: \(error)")
        }
        return nil
    }
}
