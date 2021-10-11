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
    
    func searcExercise(id: String) {
        searchBar.tap()
        searchBar.typeText("\(id)")
        
        XCTAssertTrue(cancelButton.waitForExistence(timeout: 1))
        XCTAssertTrue(clearTextButton.waitForExistence(timeout: 1))
    }
    
    func selectExercise(id : String, name : String){
        let exercise = getExercise(meta: "\(id): \(name)")
        XCTAssertTrue(exercise.waitForExistence(timeout: 1))
        exercise.tap()
    }
    
    func searchAndSelectExercise(id : String, name : String) {
        searcExercise(id: id)
        selectExercise(id: id, name: name)
    }
    
    func cleartText(){
        clearTextButton.tap()
    }
    
    func isSearchBarDisplayed() {
        XCTAssertTrue(searchBar.waitForExistence(timeout: 10))
        XCTAssertEqual(searchBar.label, "Search exercises")
        XCTAssertEqual(searchBar.placeholderValue, "Search exercises")
    }
    
    func isEmptyListDisplayed(){
        XCTAssertTrue(emptyList.waitForExistence(timeout: 1))
    }
    
    private func getExercise(meta : String) -> XCUIElement {
        return XCUIApplication().staticTexts[meta]
    }
    
    var searchBar : XCUIElement {
        return XCUIApplication().searchFields[Accessibility.Search.searchExercisesText]
    }
    
    var cancelButton : XCUIElement {
        return XCUIApplication().buttons["Cancel"]
    }
    
    var clearTextButton : XCUIElement {
        return XCUIApplication().buttons["Clear text"]
    }
    
    var emptyList : XCUIElement {
        return XCUIApplication().tables["Empty list"]
    }
    
}
