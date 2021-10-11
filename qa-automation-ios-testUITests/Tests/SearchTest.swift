//
//  SearchTest.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 10/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import XCTest

class SearchTest: AppStarter, SearchScreen, LoginScreen, ExerciseScreen {
    
    private let searchExercisesText = "Search exercises"
    
    func test_searchExistingExercise(){
        let exercise = Excercise(id: 307, name: "Bear Walk")
        
        login()
        
        XCTAssertTrue(searchBar.waitUntilExists(10))
        XCTAssertEqual(searchBar.label, searchExercisesText)
        XCTAssertEqual(searchBar.placeholderValue, searchExercisesText)
        
        searcExercise(10)
        
        XCTAssertTrue(cancelButton.waitUntilExists())
        XCTAssertTrue(clearTextButton.waitUntilExists())
        
        cleartText()
        searcExercise(exercise.id)
        
        XCTAssertTrue(cancelButton.waitUntilExists())
        XCTAssertTrue(clearTextButton.waitUntilExists())
        
        selectExercise(exercise)
        
        XCTAssertTrue(backButton.waitUntilExists())
        XCTAssertTrue(exerciseTitle.waitUntilExists())
        XCTAssertTrue(exerciseImage.waitUntilExists())
    }
    
    func test_searchNonExistingExercise(){
        let nonExistentExercise = Excercise(id: 12345, name: "Sleep")
        
        login()
        searcExercise(nonExistentExercise.id)
        XCTAssertTrue(emptyList.waitUntilExists())
    }
}
