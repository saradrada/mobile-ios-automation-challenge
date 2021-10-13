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
               _ password: String = LoginData.validPassword.rawValue) {
        typeUsername(username)
        typePassword(password)
        loginButton.tap()
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
        return XCUIApplication().textFields[Accessibility.Login.usernameTextField]
    }
    
    var passwordTextField: XCUIElement {
        return XCUIApplication().textFields[Accessibility.Login.passwordTextField]
    }
    
    var loginButton: XCUIElement {
        return XCUIApplication().buttons[Accessibility.Login.loginButton]
    }
    
    var dismissAlert: XCUIElement {
        return XCUIApplication().alerts[Accessibility.Login.tryAgain]
    }
    
    var dismissButton: XCUIElement {
        return XCUIApplication().buttons[Accessibility.Login.disminssButton]
    }
    
    var invalidCredentialsAlertTitle: XCUIElement {
        return XCUIApplication().staticTexts[Accessibility.Login.tryAgain]
    }
    
    var invalidCredentialsAlertDescription: XCUIElement {
        return XCUIApplication().staticTexts[Accessibility.Login.wrongCredentialsText]
    }
    
}
