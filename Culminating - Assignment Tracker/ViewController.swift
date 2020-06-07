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
    
    
    let test1 = Assignment(name: "Test 1", description: "This is the First Assignment. This has been preprogrammed", tasks: 8, date: 5, tasksCompleted: 0, assignmentNumber: 0)
    let test2 = Assignment(name: "Test 2", description: "This is the Second Assignment. This has been preprogrammed", tasks: 5, date: 5, tasksCompleted: 0, assignmentNumber: 0)

    
    //MARK: Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = assignments[indexPath.row].name
        return cell
    }
    
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
            
            let viewAssignmentNumber = assignments[indexPath.row].assignmentNumber
            childController.viewTasksCompleted = viewAssignmentNumber

            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(childController, animated: true)
        }
    }
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignments.append(test1)
        assignments.append(test2)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        performSegue(withIdentifier: "CreateAssignment", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let childController = segue.destination as? AssignmentMaker {
            
            // Set this view controller as the delegate for the AssignmentMaker view controller
            childController.delegate = self
        }
    }
    
    //MARK: AssignmentSaver Methods
    func save(new: Assignment) {
        
        //Append new assignment to list of assignments
        assignments.append(new)
        
        let indexPath = IndexPath(row: assignments.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    func change(new: Changes) {
        assignments[new.assignmentNumber].tasksCompleted = new.tasksCompleted
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? AssignmentMaker {
//            vc.newAssignment = assignments[1]
//        }
//    }
    
    
}

