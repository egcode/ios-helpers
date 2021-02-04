//
//  Game.swift
//  EnvoyCodeTest
//
//  Created by Golovanov, Eugene on 2/7/18.
//  Copyright © 2018 Envoy. All rights reserved.
//

import Foundation

public class Game: CustomDebugStringConvertible {
    public var name: String = ""
    public var viewers: Int = 0
    public var imageLargeUrl:String = ""
    public var imageMediumUrl:String = ""
    public var imageSmallUrl:String = ""
    
    public init(data: [String:AnyObject]) {
        if let v = data["viewers"] as? Int {
            self.viewers = v
        }
        if let gameData = data["game"]  {
            self.name = (gameData["name"] as? String ?? "").trim()
            if let boxData = gameData["box"] as AnyObject? {
                self.imageLargeUrl = (boxData["large"] as? String ?? "").trim()
                self.imageMediumUrl = (boxData["medium"] as? String ?? "").trim()
                self.imageSmallUrl = (boxData["small"] as? String ?? "").trim()
            }
        }
    }
    
    public var debugDescription: String {
        return "\n<\nname=\(self.name) \nviewers=\(self.viewers) \nimageLargeUrl=\(self.imageLargeUrl) \nimageMediumUrl=\(self.imageMediumUrl) \nimageSmallUrl=\(self.imageSmallUrl) ;\n>"
    }
}
