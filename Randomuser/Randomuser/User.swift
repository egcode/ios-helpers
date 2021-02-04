//
//  User.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import Foundation


public class User: CustomDebugStringConvertible {
    public var username: String = ""
    public var firstName:String = ""
    public var lastName:String = ""
    var fullName: String {
        return "\(self.firstName) \(self.lastName)"
    }
    public var title:String = ""
    public var email:String = ""
    public var gender:String = ""
    public var phone:String = ""
    public var thumbnailUrl:String = ""
    public var mediumUrl:String = ""
    public var largeUrl:String = ""


    public init(data: [String:AnyObject]) {
        if let pictureData = data["picture"] {
            self.thumbnailUrl = (pictureData["thumbnail"] as? String ?? "").trim()
            self.mediumUrl = (pictureData["medium"] as? String ?? "").trim()
            self.largeUrl = (pictureData["large"] as? String ?? "").trim()
        }
        if let loginData = data["login"] {
            self.username = (loginData["username"] as? String ?? "").trim()
        }
        if let nameData = data["name"] {
            self.firstName = (nameData["first"] as? String ?? "").trim().capitalized
            self.lastName = (nameData["last"] as? String ?? "").trim().capitalized
            self.title = (nameData["title"] as? String ?? "").trim()
        }
        self.email = (data["email"] as? String ?? "").trim()
        self.phone = (data["phone"] as? String ?? "").trim()
        self.gender = (data["gender"] as? String ?? "").trim()
    }
    
    public var debugDescription: String {
        return "\n<\nusername=\(self.username) \nfirstName=\(self.firstName) \nlastName=\(self.lastName) \nfullName=\(self.fullName) \ntitle=\(self.title) \nemail=\(self.email) \ngender=\(self.gender) \nphone=\(self.phone)  \nthumbnailUrl=\(self.thumbnailUrl) \nmediumUrl=\(self.mediumUrl) \nlargeUrl=\(self.largeUrl);\n>"
    }
}
