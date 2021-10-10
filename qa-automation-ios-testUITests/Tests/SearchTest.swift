//
//  SearchTest.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 10/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import XCTest

class SearchTest: AppStarter, SearchScreen, LoginScreen, ExerciseDetailsScreen {
    
    func test_searchExistingExercise(){
        login()
        isSearchBarDisplayed()
        searcExercise(id: "10")
        cleartText()
        searchAndSelectExercise(id: "124", name: "Butterfly Reverse")
        isExerciseDetailsScreenDisplayed()
    }
    
    func test_searchNonExistingExercise(){
        login()
        isSearchBarDisplayed()
        searcExercise(id: "00")
        isEmptyListDisplayed()
    }
}
