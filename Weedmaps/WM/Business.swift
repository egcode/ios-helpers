//
//  Business.swift
//  WM
//
//  Created by Golovanov, Eugene on 2/26/18.
//  Copyright © 2018 Golovanov, Eugene. All rights reserved.
//

import Foundation

public class Business: CustomDebugStringConvertible {
    public var name: String = ""
    public var id: String = ""
    public var imageUrl: String = ""
    public var url: String = ""
    public var displayAddress: String = ""
    public var rating: Float = 0

    public init(data: [String:AnyObject]) {
        self.name = (data["name"] as? String ?? "").trim()
        self.id = (data["id"] as? String ?? "").trim()
        self.imageUrl = (data["image_url"] as? String ?? "").trim()
        self.url = (data["url"] as? String ?? "").trim()

        if let locationData = data["location"] as? [String:AnyObject], let locArr = locationData["display_address"] as? [String]  {
            self.displayAddress = locArr.flatMap({$0}).joined()
        }
        if let r = data["rating"] as? Float {
            self.rating = r
        }
    }
    
    public var debugDescription: String {
        return "\n< \nname=\(self.name) \nrating=\(self.rating) \nid=\(self.id) \ndisplayAddress=\(self.displayAddress) \nimageUrl=\(self.imageUrl) \nurl=\(self.url) ;\n>"
    }
}
