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
        XCTAssertTrue(usernameTextField.waitUntilExists())
        XCTAssertTrue(passwordTextField.waitUntilExists())
        XCTAssertTrue(loginButton.waitUntilExists())
        
        typeUsername()
        typePassword()
        tapOnLogin()
        
        XCTAssertTrue(searchBar.waitUntilExists())
        XCTAssertEqual(searchBar.label, searchExercisesText)
        XCTAssertEqual(searchBar.placeholderValue, searchExercisesText)
    }
    
    func test_loginWithInvalidCredentials() {
        
        typeUsername(LoginData.validUsername.rawValue)
        typePassword(LoginData.invalidPassword.rawValue)
        tapOnLogin()
        
        XCTAssertTrue(dismissAlert.waitUntilExists())
        XCTAssertTrue(invalidCredentialsAlertTitle.waitUntilExists())
        XCTAssertTrue(invalidCredentialsAlertDescription.waitUntilExists())
        XCTAssertTrue(dismissButton.waitUntilExists())
        
        tapOnDismiss()
        
        XCTAssertTrue(loginButton.waitUntilExists())
    }
    
    func test_loginWithEmptyCredentials() {
        tapOnLogin()
        XCTAssertTrue(dismissAlert.waitUntilExists())
    }
}
