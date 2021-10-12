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
    
    var searchBar : XCUIElement {
        return XCUIApplication().searchFields[Accessibility.Search.searchExercisesText]
    }
}
