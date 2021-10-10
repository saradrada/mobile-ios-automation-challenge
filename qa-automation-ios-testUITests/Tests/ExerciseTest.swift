//
//  ExerciseTest.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 10/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import XCTest

class ExerciseTest: AppStarter, ExerciseScreen, LoginScreen, SearchScreen {
    
    func test_correctExerciseDetails() {
        login()
        selectExercise(id: "341", name: "Body-Ups")
        isExerciseScreenDisplayed()
        isExerciseTitleCorrect(title: "Body-Ups")
    }
    
    func test_goBack(){
        login()
        selectExercise(id: "307", name: "Bear Walk")
        isExerciseScreenDisplayed()
        isExerciseTitleCorrect(title: "Bear Walk")
        backButton.tap()
        isSearchBarDisplayed()
    }
}
