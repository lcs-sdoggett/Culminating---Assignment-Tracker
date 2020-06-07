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
    
    var viewTasksCompleted = 0
    
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        setDescription()
        setName()
        update()
    }
    
    // Set description label
    func setDescription() {
        descriptionOutput.text = viewDescription
    }
    
    // Set name label
       func setName() {
           nameOutput.text = viewName
       }
    
    // Update based on tasks
    func update() {
        setTasksCompleted()
        setProgressBar()
        setPercentProgress()
        setUrgencyLabel()
    }
    
    // Set task label
    func setTasksCompleted() {
        let viewTasksCompletedAsString = String(viewTasksCompleted)
        tasksOutput.text = viewTasksCompletedAsString
    }
    
    // Set propress bar
    func setProgressBar() {
        let progress = Float(viewTasksCompleted) / Float(viewTasks)
        progressBar.progress = progress
    }
    
    // Set percent label
    func setPercentProgress() {
        let progress = Int(100 * (Float(viewTasksCompleted) / Float(viewTasks)))
        percentageOutput.text = "\(progress)%"
    }
    
    func setUrgencyLabel() {
        urgencyOutput.text = "Task is not very urgent"
    }
    
    // Increase tasks
    @IBAction func increaseTasks(_ sender: Any) {
        
        // If they are trying to increase the completed tasks when it is 100%, dont increase
        if viewTasksCompleted == viewTasks {
            
        } else {
            // If there are more tasks to be completed, add 1 to completed tasks and update everythinng
            viewTasksCompleted += 1
            update()
        }
        
    }
    
    // Decrease tasks
    @IBAction func decreaseTasks(_ sender: Any) {
        
        // If they are trying to decrease the completed tasks when it is 0%, dont decrease
        if viewTasksCompleted == 0 {
            
        } else {
            // If there are more then 1 tasks completed, subtract 1 to completed tasks and update everythinng
            viewTasksCompleted -= 1
            update()
        }
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
