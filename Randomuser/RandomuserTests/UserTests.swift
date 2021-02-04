//
//  UserTests.swift
//  Randomuser
//
//  Created by Eugene Golovanov on 5/2/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import XCTest
@testable import Randomuser

class UserTests: XCTestCase {

    var user: User!
    
    func testParseUserData() {
        
        let mockData = [
            "picture": [
                "large" : "https://randomuser.me/api/portraits/men/64.jpg",
                "medium" : "https://randomuser.me/api/portraits/med/men/64.jpg",
                "thumbnail" : "https://randomuser.me/api/portraits/thumb/men/64.jpg"
            ],
            "login": [
                "username" : "blackelephant447"
            ],
            "email": "leroy.ellis@example.com",
            "name": [
                "first" : "leroy",
                "last" : "ellis",
                "title" : "mr"
            ], "phone": "017683 89145", "gender": "male"] as [String : Any]

        //Loop through properties
        let userMirror = Mirror(reflecting: User(data: mockData as [String : AnyObject]))
        let properties = userMirror.children
        for property in properties {
            XCTAssert("\(property.value)" != "", "User \(property.label!) is empty")
        }
    }
    
}
