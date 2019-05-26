//
//  HomeworkTableViewCell.swift
//  NIBMConnect
//
//  Created by Dushma on 5/26/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import UIKit

class HomeworkTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        container.layer.cornerRadius = 8
    }

    func addHomeworkData(work: HomeworkModel)  {
        
        titleLabel.text = work.title
        descLabel.text = work.description
        
    }
    
    
}
