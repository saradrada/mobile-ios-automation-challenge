//
//  Excercise.swift
//  qa-automation-ios-test
//
//  Created by Lorenzo Bulfone on 28.02.20.
//  Copyright © 2020 Lorenzo Bulfone. All rights reserved.
//

import Foundation

struct ExcerciseList: Codable {
  var results: [Excercise]
}

struct Excercise: Codable {
  var id: Int
  var name: String
  var meta: String {
    return "\(id): \(name)"
  }
}
