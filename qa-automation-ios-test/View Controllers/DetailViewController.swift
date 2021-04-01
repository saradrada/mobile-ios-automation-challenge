//
//  DetailViewController.swift
//  qa-automation-ios-test
//
//  Created by Michael Fanelli on 29.03.21.
//  Copyright © 2021 Lorenzo Bulfone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var workoutTitleLabel: UILabel!
  
  var workoutName: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    workoutTitleLabel.text = workoutName
  }
}
