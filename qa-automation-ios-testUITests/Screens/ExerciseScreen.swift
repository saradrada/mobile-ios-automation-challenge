//
//  ExerciseScreen.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 10/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import Foundation
import XCTest

protocol ExerciseScreen { }

extension ExerciseScreen {
    
    var backButton : XCUIElement {
        return XCUIApplication().buttons[Accessibility.Exercise.backButton]
    }
    
    var exerciseName : XCUIElement {
        return XCUIApplication().staticTexts[Accessibility.Exercise.exerciseName]
    }
    
    var exerciseImage : XCUIElement {
        return XCUIApplication().images[Accessibility.Exercise.exerciseImage]
    }
}
