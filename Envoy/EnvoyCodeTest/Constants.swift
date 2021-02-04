//
//  Constants.swift
//  EnvoyCodeTest
//
//  Created by Golovanov, Eugene on 2/7/18.
//  Copyright © 2018 Envoy. All rights reserved.
//

import UIKit

// -- API:

enum ApiUrl : String {
    case main = "https://api.twitch.tv/"
    case topTwenty = "https://api.twitch.tv/kraken/games/top?limit=20"
}

let ClientID = "nq033i1s4i5vgvu8q9pqot96ugl9dd"



// -- Colors:

class Color : UIColor {
    static var navigationBar = UIColor(red: 94/255.0, green: 77.0/255.0, blue: 140.0/255.0, alpha: 1.0)
    static var navigationBarBorder = UIColor(red: 110.0/255.0, green: 94.0/255.0, blue: 153.0/255.0, alpha: 1.0)
}
