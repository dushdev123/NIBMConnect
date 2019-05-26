//
//  ResetPasswordViewController.swift
//  NIBMConnect
//
//  Created by Dushma on 5/20/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {
    
    

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        submitButton.layer.cornerRadius = 8
        
    }
    
    @IBAction func submitClick(_ sender: Any) {
        
        if email.text == "" {
            self.alert(message: "Enter your email")
            return
        }
        
        if !isValidEmail(testStr: email.text!) {
            self.alert(message: "Not a valid email")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email.text!) { error in
            if (error != nil){
                self.alert(message: error?.localizedDescription ?? "Error")
                return
            }
            
            self.alert(message: "A password reset email has been sent to your account")
            
            
        }
        
    }
    
    @IBAction func closeButtonClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
