//
//  LoginController.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 18/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit
import Firebase
class LoginController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var createAccount: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    @IBAction func loginButton(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
            if error != nil {
                print(error!)
            }
            else {
                print("Login successful")
                self.navigationController?.pushViewController(CartController(), animated: true)
                
                
            }
        }
    }
    @IBAction func createAccount(_ sender: UIButton) {
        self.navigationController?.pushViewController(SignupController(), animated: true)
        
    }
}
