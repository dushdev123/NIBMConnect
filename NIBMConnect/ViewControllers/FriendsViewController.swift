//
//  FriendsViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/21/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import UIKit
import Firebase

class FriendsViewController: UIViewController {
    
    var friendsArray : [Student] = []
    var ref: DatabaseReference!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Friends"
        
        ref = Database.database().reference()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        getFriendsFromFirebase()
    }
    
    func getFriendsFromFirebase() {
        
        let friendsRef = ref.child("friends");
        
        friendsRef.observe(.value) { snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                
                let studentDic = child.value as! NSDictionary
                
                let first_name = studentDic["first_name"] as! String
                let last_name = studentDic["last_name"] as! String
                let city = studentDic["city"] as! String
                let birthday = studentDic["birthday"] as? String
                let imageUrl = studentDic["imageUrl"] as! String
                let fb_profile_url = studentDic["facebookUrl"] as? String
                let gender = studentDic["gender"] as? String
                let phoneNumber = studentDic["phoneNumber"] as? String

                
                let student = Student(
                    fName: first_name,
                    lName: last_name,
                    dob: birthday,
                    city: city,
                    imgUrl: imageUrl,
                    fbUrl: fb_profile_url,
                    gender: gender,
                    phoneNuber: phoneNumber
                )

                self.friendsArray.append(student)
                
                
                print(child)
                
                
               
            }
            
            self.tableView.reloadData()
            
            self.activityIndicator.stopAnimating()
        }
        
    }
    
    
    
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        
        cell.selectionStyle = .none
        
        cell.populateData(student: friendsArray[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "friendDetailViewSegue", sender: friendsArray[indexPath.row])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "friendDetailViewSegue" {
            if let viewController = segue.destination as? FriendDetailViewController {
                    viewController.student = sender as? Student
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    
    
}
