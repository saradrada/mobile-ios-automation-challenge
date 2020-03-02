//
//  LoginViewController.swift
//  qa-automation-ios-test
//
//  Created by Lorenzo Bulfone on 28.02.20.
//  Copyright © 2020 Lorenzo Bulfone. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  @IBOutlet weak var usernameField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  @IBAction func login(sender: UIButton) {
    // if true {
    if usernameField.text == "automation@gymondo.de" && passwordField.text == "automation" {
      performSegue(withIdentifier: "showList", sender: nil)
    } else {
      let alertController = UIAlertController(title: "Try again", message:
          "Wrong credentials", preferredStyle: .alert)
      alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

      self.present(alertController, animated: true, completion: nil)    }
  }
}
