//
//  SearchTest.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 10/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import XCTest

class SearchTest: AppStarter, SearchScreen, LoginScreen, ExerciseScreen {
    
    func test_searchExistingExercise(){
        let searchExercisesText = "Search exercises"
        let exercise = ExerciseBuilder()
            .with(id: 307)
            .with(name: "Bear Walk")
            .build()
        
        login()
        
        XCTAssertTrue(searchBar.waitUntilExists(10))
        XCTAssertEqual(searchBar.label, searchExercisesText)
        XCTAssertEqual(searchBar.placeholderValue, searchExercisesText)
        
        searcExercise(10)
        
        XCTAssertTrue(cancelButton.waitUntilExists())
        XCTAssertTrue(clearTextButton.waitUntilExists())
        
        cleartText()
        searcExercise(exercise.id)
        
        XCTAssertTrue(getExercise(exercise).waitUntilExists())
    }
    
    func test_searchNonExistingExercise(){
        let nonExistentExercise = ExerciseBuilder()
            .with(id: 12345)
            .with(name: "Sleep")
            .build()
        
        login()
        searcExercise(nonExistentExercise.id)
        XCTAssertTrue(emptyList.waitUntilExists())
    }
}
