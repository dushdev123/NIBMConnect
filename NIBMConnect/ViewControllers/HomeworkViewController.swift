//
//  HomeworkViewController.swift
//  NIBMConnect
//
//  Created by Oshan Madushanka on 5/21/19.
//  Copyright © 2019 Dushma. All rights reserved.
//

import UIKit

class HomeworkViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    
    private var homeWorkArray: [HomeworkModel] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "Homework"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let savedHomeworkArray = UserDefaults.standard.decode(for: [HomeworkModel].self, using: String(describing: HomeworkModel.self))
        
        homeWorkArray.removeAll()
        
        homeWorkArray = savedHomeworkArray ?? []
        
        tableView.reloadData()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeWorkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeworkcell", for: indexPath) as! HomeworkTableViewCell
        
        cell.addHomeworkData(work: homeWorkArray[indexPath.row])
        
        cell.selectionStyle = .none
        
        return cell
        
    }

    @IBAction func addNewClick(_ sender: Any) {
        performSegue(withIdentifier: "addHomeworkSegue", sender: nil)
    }
    
}
