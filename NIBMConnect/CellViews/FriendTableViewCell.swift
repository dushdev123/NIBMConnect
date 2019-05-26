//
//  FriendTableViewCell.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/21/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import UIKit
import Nuke


class FriendTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var container: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        container.layer.cornerRadius = 8
        friendImage.layer.cornerRadius = friendImage.frame.width / 2
        
    }
    
    func populateData(student: Student)  {
        
        name.text = student.last_name
        city.text = student.city
        
        let imgUrl = URL(string: student.imageUrl)!
                
        Nuke.loadImage(with: imgUrl, into: friendImage)
        
    }
    
    
}
