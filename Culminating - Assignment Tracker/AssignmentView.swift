//
//  AssignmentView.swift
//  Culminating - Assignment Tracker
//
//  Created by Doggett, Scott on 2020-05-29.
//  Copyright © 2020 Doggett, Scott. All rights reserved.
//

import UIKit

class AssignmentView: UIViewController {

    //MARK: Properties

    //MARK: Outlets
    
    @IBOutlet var nameOutput: UILabel!
    
    @IBOutlet var descriptionOutput: UILabel!
    
    @IBOutlet var tasksOutput: UILabel!
    
    @IBOutlet var percentageOutput: UILabel!
    
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var urgencyOutput: UILabel!
    
    
    //MARK: Properties
    
    var viewName: String = ""
    
    var viewDescription: String = ""
    
    var viewTasks: Int = 0
    
    var viewDate: Int = 0
    
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        setDescription()
        setTask()
        setName()
        
    }
    
    
    func setDescription() {
        descriptionOutput.text = viewDescription
    }
    
    func setTask() {
        let viewTasksAsString = String(viewTasks)
        tasksOutput.text = viewTasksAsString
    }
    
    func setName() {
        nameOutput.text = viewName
    }
    
    
    
    
    
    @IBAction func increaseTasks(_ sender: Any) {
        viewTasks += 1
        setTask()
    }
    
    @IBAction func decreaseTasks(_ sender: Any) {
        viewTasks -= 1
        setTask()

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
