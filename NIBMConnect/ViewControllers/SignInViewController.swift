//
//  SignInViewController.swift
//  NIBMConnect
//
//  Created by Dushma on 5/20/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signInButton.layer.cornerRadius = 8
        
        navigationController?.isNavigationBarHidden = true
    }
    

    @IBAction func signInClick(_ sender: Any) {
        
        if email.text?.isEmpty ?? true {
            self.alert(message: "Enter Email")
            return
        }
        
        if password.text?.isEmpty ?? true {
           self.alert(message: "Enter Password")
        }
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] user, error in
            guard let strongSelf = self else { return }
            
            if (error != nil){
                strongSelf.alert(message: error?.localizedDescription ?? "Error")
                return
            }else{
                strongSelf.performSegue(withIdentifier: "signInToHome", sender: self)
            }
        }
        
    }
    
    @IBAction func signUpClick(_ sender: Any) {
        performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
    @IBAction func forgotPasswordClick(_ sender: Any) {
        performSegue(withIdentifier: "forgotPassword", sender: nil)
    }
    

}
