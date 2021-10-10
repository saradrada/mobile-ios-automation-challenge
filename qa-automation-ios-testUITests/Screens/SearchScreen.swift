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
    
    func isSearchBarDisplayed() {
        XCTAssertTrue(searchBar.waitForExistence(timeout: 10))
        XCTAssertEqual(searchBar.label, "Search exercises")
        XCTAssertEqual(searchBar.placeholderValue, "Search exercises")
    }
    
    var searchBar : XCUIElement {
        return XCUIApplication().searchFields["Search exercises"]
    }
}
