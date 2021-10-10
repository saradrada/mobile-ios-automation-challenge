//
//  LoginScreen.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 9/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import XCTest

protocol LoginScreen { }

extension LoginScreen {
    
    func login(_ username: String = LoginData.validUsername.rawValue,
               _ password: String = LoginData.validPassword.rawValue){
        isLoginScreenDisplayed()
        typeUsername(username)
        typePassword(password)
        loginButton.tap()
    }
    
    func isLoginScreenDisplayed(){
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: 1))
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 1))
        XCTAssertTrue(loginButton.waitForExistence(timeout: 1))
    }
    
    func isInvalidCredentialsAlertDisplayed(){
        XCTAssertTrue(dismissAlert.waitForExistence(timeout: 5))
        XCTAssertTrue(invalidCredentialsAlertTitle.waitForExistence(timeout: 1))
        XCTAssertTrue(invalidCredentialsAlertDescription.waitForExistence(timeout: 1))
        XCTAssertTrue(dismissButton.waitForExistence(timeout: 1))
    }
    
    func typeUsername(_ username: String = LoginData.validUsername.rawValue) {
        usernameTextField.tap()
        usernameTextField.typeText(username)
    }
    
    func typePassword(_ password: String = LoginData.validPassword.rawValue) {
        passwordTextField.tap()
        passwordTextField.typeText(password)
    }
    
    func tapOnLogin() {
        loginButton.tap()
    }
    
    func tapOnDismiss() {
        dismissButton.tap()
    }
    
    var usernameTextField: XCUIElement {
        return XCUIApplication().textFields["usernameTextField"]
    }
    
    var passwordTextField: XCUIElement {
        return XCUIApplication().textFields["passwordTextField"]
    }
    
    var loginButton: XCUIElement {
        return XCUIApplication().buttons["loginButton"]
    }
    
    var dismissAlert: XCUIElement {
        return XCUIApplication().alerts["Try again"]
    }
    
    var dismissButton: XCUIElement {
        return XCUIApplication().buttons["Dismiss"]
    }
    
    var invalidCredentialsAlertTitle: XCUIElement {
        return XCUIApplication().staticTexts["Try again"]
    }
    
    var invalidCredentialsAlertDescription: XCUIElement {
        return XCUIApplication().staticTexts["Wrong credentials"]
    }
    
}
