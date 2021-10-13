//
//  ExerciseTest.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 10/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import XCTest

class ExerciseTest: AppStarter, ExerciseScreen, LoginScreen, SearchScreen {
    
    func test_selectExercise(){
        let exercise = ExerciseBuilder()
            .with(id: 341)
            .with(name: "Body-Ups")
            .build()
        
        login()
        selectExercise(exercise)
        
        XCTAssertTrue(backButton.waitUntilExists())
        XCTAssertTrue(exerciseImage.waitUntilExists())
        XCTAssertTrue(exerciseName.waitUntilExists())
        XCTAssertEqual(exerciseName.label, exercise.name)
    }
    
    func test_goBack(){
        let exercise = ExerciseBuilder()
            .with(id: 307)
            .with(name: "Bear Walk")
            .build()
       
        login()
        selectExercise(exercise)
        
        XCTAssertTrue(backButton.waitUntilExists())
        
        backButton.tap()
        
        XCTAssertTrue(searchBar.waitUntilExists())
    }
}
