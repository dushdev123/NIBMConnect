//
//  MyProfileViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/21/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    
    @IBOutlet weak var author_image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        author_image.layer.cornerRadius = author_image.frame.width / 2
    }

}
