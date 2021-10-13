//
//  CustomeWait.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 10/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import XCTest

extension XCUIElement {
    func waitUntilExists(_ timeout: Double = 1) -> Bool {
        return self.waitForExistence(timeout: timeout)
    }
}
