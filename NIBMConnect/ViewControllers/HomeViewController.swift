//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by Dushma on 5/20/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import UIKit
import Firebase
import LocalAuthentication

class HomeViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var friendsImageView: UIImageView!
    @IBOutlet weak var homeworkImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        friendsImageView.layer.cornerRadius = friendsImageView.frame.width / 2
        homeworkImageView.layer.cornerRadius = homeworkImageView.frame.width / 2

        
    }
    
    @IBAction func myProfileClick(_ sender: Any) {
         authenticateUsingBioMetrics()
    }
    
    @IBAction func homeworkClick(_ sender: Any) {
        performSegue(withIdentifier: "homeWorkSqgue", sender: nil)
    }
    
    @IBAction func myFriendsClick(_ sender: Any) {
        performSegue(withIdentifier: "myFriends", sender: nil)
    }
    
    @IBAction func logOutClick(_ sender: Any) {
        
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
             self.performSegue(withIdentifier: "goToSignIn", sender: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
       
        
        
    }
    
    private func authenticateUsingBioMetrics() {
        let authContext = LAContext()
        let authReason = "Please use Touch ID to access Your Account"
        var authError : NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &authError){
            
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: authReason, reply: { (success,error) -> Void in
                
                if error != nil{
                    DispatchQueue.main.async {
                        self.alert(message: "Authentication Failed")
                    }
                    return
                }
                
                
                if success{
                    //Go to My Account Page
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "myProfileSegue", sender: nil)
                    }
                }
                
                
            })
            
        }
        else{
            self.alert(message: "Authentication Failed")
        }
    }
}



