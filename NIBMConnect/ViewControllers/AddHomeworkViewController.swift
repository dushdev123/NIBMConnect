//
//  AddHomeworkViewController.swift
//  NIBMConnect
//
//  Created by Dushma on 5/26/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import UIKit

class AddHomeworkViewController: UIViewController {

    @IBOutlet weak var homwWorkTitle: UITextField!
    @IBOutlet weak var homeworkDescription: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = 8
        
        title = "Add Homework"
       

        
    }
    
 

    @IBAction func saveHomework(_ sender: Any) {
        
        if (homwWorkTitle.text == "") {
            alert(message: "title is required")
            return
        }
        
        if (homeworkDescription.text == ""){
            alert(message: "Description Is Required")
            return
        }
        
        let homework = HomeworkModel(title: homwWorkTitle.text ?? "Homework", description: homeworkDescription.text ?? "", addedTime: Date())
        
        var workList = UserDefaults.standard.decode(for: [HomeworkModel].self, using: String(describing: HomeworkModel.self))
        
        //cheack if old saved items available
        if (workList == nil || (workList?.isEmpty)!) {
            //if not available add a new array
            UserDefaults.standard.encode(for:[homework], using: String(describing: HomeworkModel.self))
        } else {
            //if available append to array and save
            workList?.append(homework)
            UserDefaults.standard.encode(for:workList, using: String(describing: HomeworkModel.self))
        }
        
        //go back
        navigationController?.popViewController(animated: true)
        
    }
    
}
