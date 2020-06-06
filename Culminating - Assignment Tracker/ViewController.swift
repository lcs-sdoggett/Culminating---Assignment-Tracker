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
        if let vc = segue.destination as? AssignmentMaker {
            
            // Set this view controller as the delegate for the AssignmentMaker view controller
            vc.delegate = self
        }
        
        if let vc = segue.destination as? AssignmentView {
            
            
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

