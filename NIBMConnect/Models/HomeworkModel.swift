//
//  File.swift
//  NIBMConnect
//
//  Created by Dushma on 5/26/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import Foundation

struct HomeworkModel: Codable {
    
    var title : String!
    var description : String!
    var addedTime: Date!
    
    init(title: String, description: String, addedTime: Date) {
        self.title = title
        self.description = description
        self.addedTime = addedTime
    }
    
    
    
    
}
