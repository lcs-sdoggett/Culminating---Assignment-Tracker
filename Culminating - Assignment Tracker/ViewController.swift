//
//  ViewController.swift
//  Culminating - Assignment Tracker
//
//  Created by Doggett, Scott on 2020-05-24.
//  Copyright © 2020 Doggett, Scott. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, AssignmentSaver {
    
    
    //MARK: Properties
    var assignments:[Assignment] = []
    
    //MARK: Methods
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        if let childController = segue.destination as? AssignmentView {
            
            //Set variable to desired value, and send it to AssignmentView
            var viewName = assignments[0].name
            childController.viewName = viewName
            
            //Set variable to desired value, and send it to AssignmentView
            var viewDescription = assignments[0].description
            childController.viewDescription = viewDescription
            
            //Set variable to desired value, and send it to AssignmentView
            var viewTasks = assignments[0].tasks
            childController.viewTasks = viewTasks
            
            //Set variable to desired value, and send it to AssignmentView
            var viewDate = assignments[0].date
            childController.viewDate = viewDate
            
        }
    }
    
    //MARK: AssignmentSaver Methods
    func save(new: Assignment) {
        
        //Append new assignment to list of assignments
        assignments.append(new)
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? AssignmentMaker {
//            vc.newAssignment = assignments[1]
//        }
//    }
    
    
}

