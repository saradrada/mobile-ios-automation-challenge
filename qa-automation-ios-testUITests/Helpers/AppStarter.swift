//
//  AppStarter.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 9/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import Foundation
import XCTest

class AppStarter: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp(){
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        
    }
}
