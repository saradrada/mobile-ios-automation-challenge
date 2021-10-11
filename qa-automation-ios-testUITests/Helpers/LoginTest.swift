//
//  LoginTest.swift
//  qa-automation-ios-testUITests
//
//  Created by Lorenzo Bulfone on 28.02.20.
//  Copyright © 2020 Lorenzo Bulfone. All rights reserved.
//

import XCTest

class LoginTest: AppStarter, LoginScreen, SearchScreen {

    private let searchExercisesText = "Search exercises"
    
    func test_loginWithValidCredentials() {
        XCTAssertTrue(searchBar.waitForExistence(timeout: 10))
        XCTAssertEqual(searchBar.label, searchExercisesText)
        XCTAssertEqual(searchBar.placeholderValue, searchExercisesText)
        
        typeUsername()
        typePassword()
        tapOnLogin()
        
        XCTAssertTrue(searchBar.waitForExistence(timeout: 10))
        XCTAssertEqual(searchBar.label, searchExercisesText)
        XCTAssertEqual(searchBar.placeholderValue, searchExercisesText)
    }
    
    func test_loginWithInvalidCredentials() {
        XCTAssertTrue(searchBar.waitForExistence(timeout: 10))
        XCTAssertEqual(searchBar.label, searchExercisesText)
        XCTAssertEqual(searchBar.placeholderValue, searchExercisesText)
        
        typeUsername(LoginData.validUsername.rawValue)
        typePassword(LoginData.invalidPassword.rawValue)
        tapOnLogin()
        
        XCTAssertTrue(searchBar.waitForExistence(timeout: 10))
        XCTAssertEqual(searchBar.label, searchExercisesText)
        XCTAssertEqual(searchBar.placeholderValue, searchExercisesText)
        
        tapOnDismiss()
    }
    
    func test_loginWithEmptyCredentials() {
        XCTAssertTrue(searchBar.waitForExistence(timeout: 10))
        XCTAssertEqual(searchBar.label, searchExercisesText)
        XCTAssertEqual(searchBar.placeholderValue, searchExercisesText)
        
        tapOnLogin()
        
        XCTAssertTrue(searchBar.waitForExistence(timeout: 10))
        XCTAssertEqual(searchBar.label, searchExercisesText)
        XCTAssertEqual(searchBar.placeholderValue, searchExercisesText)
        
        tapOnDismiss()
        
        XCTAssertTrue(searchBar.waitForExistence(timeout: 10))
        XCTAssertEqual(searchBar.label, searchExercisesText)
        XCTAssertEqual(searchBar.placeholderValue, searchExercisesText)
    }
}
