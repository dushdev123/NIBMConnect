//
//  SignUpViewController.swift
//  NIBMConnect
//
//  Created by Dushma on 5/20/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func signUpClick(_ sender: Any) {
        
        if email.text == "" {
            self.alert(message: "enter a email")
            return
        }
        
        if !isValidEmail(testStr: email.text ?? ""){
            self.alert(message: "Enter a valid email")
            return
        }
        
        if password.text == "" {
            self.alert(message: "Enter a password")
            return
        }
        
        if password.text != confirmPassword.text {
            self.alert(message: "Passwords does not match")
            return
        }
        
        
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { authResult, error in
            if (error != nil) {
                self.alert(message: error?.localizedDescription ?? "Error")
                return
            }
            
            //user created
            self.performSegue(withIdentifier: "signUpToHome", sender: nil)
            
            
        }
        
    }
    
    @IBAction func closeClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
