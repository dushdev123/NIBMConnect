//
//  FriendDetailViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/22/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import UIKit
import Nuke

class FriendDetailViewController: UIViewController {
    
    
    @IBOutlet weak var friendImageViEW: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var facebookUrl: UILabel!
    
    
    var student: Student? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendImageViEW.layer.cornerRadius = friendImageViEW.frame.width / 2

        let imgUrl = URL(string: student!.imageUrl)!
        
         Nuke.loadImage(with: imgUrl, into: friendImageViEW)
        
        name.text = "\(student?.first_name ?? "") \(student?.last_name ?? "")"
        
        birthday.text = student?.dateOfBirth
        
        city.text = student?.city ?? ""
        
        gender.text = student?.gender ?? ""
        
        phoneNumber.text = student?.phoneNumber ?? ""
        
        facebookUrl.text = student?.facebookUrl ?? ""
        
        print(student?.facebookUrl)
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
