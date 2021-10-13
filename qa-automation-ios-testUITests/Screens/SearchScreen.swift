//
//  SearchScreen.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 9/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import XCTest

protocol SearchScreen { }

extension SearchScreen {
    
    func searcExercise(_ id: Int) {
        searchBar.tap()
        searchBar.typeText("\(id)")
    }
    
    func selectExercise(_ exercise : Excercise){
        let foundExercise = getExercise(meta: "\(exercise.id): \(exercise.name)")
        foundExercise.tap()
    }
    
    func cleartText(){
        clearTextButton.tap()
    }
    
    func getExercise(_ exercise : Excercise) -> XCUIElement {
        return XCUIApplication().staticTexts["\(exercise.id): \(exercise.name)"]
    }
    
    var searchBar : XCUIElement {
        return XCUIApplication().searchFields[Accessibility.Search.searchExercisesText]
    }
    
    var cancelButton : XCUIElement {
        return XCUIApplication().buttons[Accessibility.Search.cancelButton]
    }
    
    var clearTextButton : XCUIElement {
        return XCUIApplication().buttons[Accessibility.Search.clearTextButton]
    }
    
    var emptyList : XCUIElement {
        return XCUIApplication().tables[Accessibility.Search.emptyList]
    }
    
}
