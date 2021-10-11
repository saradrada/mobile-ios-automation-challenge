//
//  ExerciseDetailsScreen.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 10/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import Foundation
import XCTest

protocol ExerciseDetailsScreen { }

extension ExerciseDetailsScreen {
    
    var backButton : XCUIElement {
        return XCUIApplication().buttons["Back"]
    }
    
    var exerciseTitle : XCUIElement {
        return XCUIApplication().staticTexts["label_workout-title"]
    }
    
    var exerciseImage : XCUIElement {
        return XCUIApplication().images["image_workout-equipment"]
    }
}
