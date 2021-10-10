//
//  qa_automation_ios_testUITests.swift
//  qa-automation-ios-testUITests
//
//  Created by Lorenzo Bulfone on 28.02.20.
//  Copyright © 2020 Lorenzo Bulfone. All rights reserved.
//

import XCTest

class qa_automation_ios_testUITests: AppStarter, LoginScreen, SearchScreen {

    func test_loginWithValidCredentials() {
        isLoginDisplayed()
        typeUsername()
        typePassword()
        tapOnLogin()
        isSearchBarDisplayed()
       
    }
    
    func test_loginWithInvalidCredentials(){
        isLoginDisplayed()
        tapOnLogin()
        isInvalidCredentialsAlertDisplayed()
        tapOnDismiss()
        
        typeUsername(LoginData.validUsername.rawValue)
        typePassword(LoginData.invalidPassword.rawValue)
        tapOnLogin()
        isInvalidCredentialsAlertDisplayed()
    }
}
