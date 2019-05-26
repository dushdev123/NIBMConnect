//
//  Student.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/21/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import Foundation


struct Student {
    
    var first_name: String
    var last_name: String
    var dateOfBirth: String?
    var city: String
    var imageUrl: String
    var facebookUrl: String?
    var gender: String?
    var phoneNumber: String?
    
    
    init(fName: String, lName: String, dob: String?, city: String, imgUrl: String, fbUrl: String?, gender: String?, phoneNuber: String?) {
        self.first_name = fName
        self.last_name = lName
        self.dateOfBirth = dob
        self.city = city
        self.imageUrl = imgUrl
        self.facebookUrl = fbUrl
        self.gender = gender
        self.phoneNumber = phoneNuber
    }
    
}
