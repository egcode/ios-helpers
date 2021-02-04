//
//  RandomuserUITests.swift
//  RandomuserUITests
//
//  Created by Eugene Golovanov on 5/1/17.
//  Copyright © 2017 Eugene Golovanov. All rights reserved.
//

import XCTest

class RandomuserUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testCanNavigateToDetailsScreen() {
        app.tables.cells.element(boundBy: 0).tap()
        let detailsTitleText = app.navigationBars.staticTexts["Details"]
        XCTAssertTrue(detailsTitleText.exists,
                      "Should be on the Details screen")
    }
    
    func testCanNavigateToSettingsScreen() {
        
        let aboutButton = app.navigationBars.buttons["Settings"]
        aboutButton.tap()
        
        let aboutTitleText = app.navigationBars.staticTexts["Settings"]
        XCTAssertTrue(aboutTitleText.exists,
                      "Should be on the Settings screen")
    }
}

