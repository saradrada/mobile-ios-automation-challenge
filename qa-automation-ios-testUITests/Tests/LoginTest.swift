//
//  LoginTest.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 10/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
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
    
    func test_loginWithInvalidCredentials(){
        isLoginScreenDisplayed()
        tapOnLogin()
        isInvalidCredentialsAlertDisplayed()
        tapOnDismiss()
        
        typeUsername(LoginData.invalidUsername.rawValue)
        typePassword(LoginData.invalidPassword.rawValue)
        tapOnLogin()
        isInvalidCredentialsAlertDisplayed()
    }
}
