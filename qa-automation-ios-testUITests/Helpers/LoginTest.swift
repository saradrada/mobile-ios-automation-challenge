//
//  LoginTest.swift
//  qa-automation-ios-testUITests
//
//  Created by Lorenzo Bulfone on 28.02.20.
//  Copyright © 2020 Lorenzo Bulfone. All rights reserved.
//

import XCTest

class LoginTest: AppStarter, LoginScreen, SearchScreen {

    func test_loginWithValidCredentials() {
        isLoginScreenDisplayed()
        typeUsername()
        typePassword()
        tapOnLogin()
        isSearchBarDisplayed()
    }
    
    func test_loginWithInvalidCredentials() {
        isLoginScreenDisplayed()
        typeUsername(LoginData.validUsername.rawValue)
        typePassword(LoginData.invalidPassword.rawValue)
        tapOnLogin()
        isInvalidCredentialsAlertDisplayed()
        tapOnDismiss()
    }
    
    func test_loginWithEmptyCredentials() {
        isLoginScreenDisplayed()
        tapOnLogin()
        isInvalidCredentialsAlertDisplayed()
        tapOnDismiss()
        isLoginScreenDisplayed()
    }
}
