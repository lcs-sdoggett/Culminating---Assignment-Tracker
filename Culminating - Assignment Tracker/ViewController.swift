//
//  ViewController.swift
//  Culminating - Assignment Tracker
//
//  Created by Doggett, Scott on 2020-05-24.
//  Copyright © 2020 Doggett, Scott. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, AssignmentSaver, AssignmentChange {
    
    
    //MARK: Properties
    var assignments:[Assignment] = []
    
    
    let Example = Assignment(name: "Example", description: "This is what one of you assignments will look like. Press the plus button when you have completed a task.", tasks: 8, date: 5, tasksCompleted: 0, assignmentNumber: 0)

    
    //MARK: Table View
    
    // Decides number of cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    // Names the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = assignments[indexPath.row].name
        return cell
    }
    
    // Makes editing possible
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // If you swipe and click delete, it will delete from the array and be removed from the table view
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            assignments.remove(at: indexPath.row)
        }
        
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
    }
    
    // Passes information to the assignment view after table view cell is clicked
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let childController = storyboard?.instantiateViewController(withIdentifier: "AssignmentView") as? AssignmentView {
            
            childController.delegate = self
            
            //Set variable to desired value, and send it to AssignmentView
            let viewName = assignments[indexPath.row].name
            childController.viewName = viewName
            
            //Set variable to desired value, and send it to AssignmentView
            let viewDescription = assignments[indexPath.row].description
            childController.viewDescription = viewDescription
            
            //Set variable to desired value, and send it to AssignmentView
            let viewTasks = assignments[indexPath.row].tasks
            childController.viewTasks = viewTasks
            
            //Set variable to desired value, and send it to AssignmentView
            let viewDate = assignments[indexPath.row].date
            childController.viewDate = viewDate
            
            //Set variable to desired value, and send it to AssignmentView
            let viewTasksCompleted = assignments[indexPath.row].tasksCompleted
            childController.viewTasksCompleted = viewTasksCompleted
            
            let viewAssignmentNumber = indexPath.row
            childController.viewAssignmentNumber = viewAssignmentNumber

            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(childController, animated: true)
        }
    }
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignments.append(Example)
        
        // Makes title big
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Creates + button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    // Goes to assignment maker when button is pressed
    @objc func addTapped() {
        performSegue(withIdentifier: "CreateAssignment", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let childController = segue.destination as? AssignmentMaker {
            
            // Set this view controller as the delegate for the AssignmentMaker view controller
            childController.delegate = self
        }
    }
    
    //MARK: AssignmentSaver and AssignmentChange Methods
    func save(new: Assignment) {
        
        //Append new assignment to list of assignments
        assignments.append(new)
        
        let indexPath = IndexPath(row: assignments.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    // Recieves information about the change
    func change(new: Changes) {
        assignments[new.assignmentNumber].tasksCompleted = new.tasksCompleted
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? AssignmentMaker {
//            vc.newAssignment = assignments[1]
//        }
//    }
    
    
}

