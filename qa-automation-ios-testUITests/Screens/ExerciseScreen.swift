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
    
    func isExerciseScreenDisplayed(){
        XCTAssertTrue(backButton.waitForExistence(timeout: 1))
        XCTAssertTrue(exerciseTitle.waitForExistence(timeout: 1))
        XCTAssertTrue(exerciseImage.waitForExistence(timeout: 1))
    }
    
    func isExerciseTitleCorrect(title: String){
        XCTAssertEqual(exerciseTitle.label, title)
    }
    
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
