//
//  ExerciseBuilder.swift
//  qa-automation-ios-testUITests
//
//  Created by Sara Ortiz Drada on 11/10/21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import Foundation

class ExerciseBuilder {
    private var id : Int = 9999
    private var name: String = "Exercise"
    
    func with(id: Int) -> ExerciseBuilder {
        self.id = id
        return self
    }
    
    func with(name: String) -> ExerciseBuilder {
        self.name = name
        return self
    }
    
    func build() -> Excercise {
        return Excercise(id: id, name: name)
    }
}
