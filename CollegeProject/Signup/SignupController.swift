//
//  SignupController.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 18/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignupController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func signupButton(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
            if error != nil {
                print(error!)
            }
            else {
                print("Reg successful")
                let detailsDB = Database.database().reference().child("Details")
                let detailsDictionary = ["Sender" : Auth.auth().currentUser?.email, "name" : self.nameField.text!, "number" : self.numberField.text!]
                detailsDB.childByAutoId().setValue(detailsDictionary) {
                    (error, reference) in
                    if error != nil {
                        print(error!)
                    }else {
                        print("message saved successfully")
                    }
                    
                    
                    self.navigationController?.pushViewController(LoginController(), animated: true)
                    
                }
            }
            
        }
    }
}
