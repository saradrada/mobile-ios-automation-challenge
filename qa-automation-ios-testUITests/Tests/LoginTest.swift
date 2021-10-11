//
//  LoginTest.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 10/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import XCTest

class LoginTest: AppStarter, LoginScreen, SearchScreen {

    private var searchExercisesText = "Search exercises"
    
    func test_loginWithValidCredentials() {
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: 10))
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 1))
        XCTAssertTrue(loginButton.waitForExistence(timeout: 1))
        
        typeUsername()
        typePassword()
        tapOnLogin()
        
        XCTAssertTrue(searchBar.waitForExistence(timeout: 10))
        XCTAssertEqual(searchBar.label, searchExercisesText)
        XCTAssertEqual(searchBar.placeholderValue, searchExercisesText)
    }
    
    func test_loginWithInvalidCredentials() {
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: 10))
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 1))
        XCTAssertTrue(loginButton.waitForExistence(timeout: 1))
        
        typeUsername(LoginData.validUsername.rawValue)
        typePassword(LoginData.invalidPassword.rawValue)
        tapOnLogin()
        
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: 10))
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 1))
        XCTAssertTrue(loginButton.waitForExistence(timeout: 1))
        
        tapOnDismiss()
        
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: 10))
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 1))
        XCTAssertTrue(loginButton.waitForExistence(timeout: 1))
    }
    
    func test_loginWithEmptyCredentials() {
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: 10))
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 1))
        XCTAssertTrue(loginButton.waitForExistence(timeout: 1))
        
        tapOnLogin()
        
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: 10))
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 1))
        XCTAssertTrue(loginButton.waitForExistence(timeout: 1))
        
        tapOnDismiss()
        
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: 10))
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 1))
        XCTAssertTrue(loginButton.waitForExistence(timeout: 1))
    }
}
