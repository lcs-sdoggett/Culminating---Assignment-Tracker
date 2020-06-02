//
//  AssignmentMaker.swift
//  Culminating - Assignment Tracker
//
//  Created by Doggett, Scott on 2020-05-29.
//  Copyright © 2020 Doggett, Scott. All rights reserved.
//

import UIKit

// Dismiss keyboard when we tap anywhere else
extension UIViewController
{
    func setupToHideKeyboardOnTapOnView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dissmissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmissKeyboard()
    {
        view.endEditing(true)
    }
}

// Types that adopt this protocol "promise" to implement the listed methods
protocol AssignmentSaver {
    
    func save(new: Assignment)
    
}

class AssignmentMaker: UIViewController {

    // MARK: Properties
    
    var delegate: AssignmentSaver?
    
    // MARK: Outlets
    
    @IBOutlet var nameInput: UITextField!
    
    @IBOutlet var descriptionInput: UITextField!
    
    @IBOutlet var dateInput: UIDatePicker!
    
    @IBOutlet var taskInput: UITextField!
    
    @IBOutlet var errorOutput: UILabel!
    
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        errorOutput.text = ""
        setupToHideKeyboardOnTapOnView()
    }
    
    
    @IBAction func create(_ sender: Any) {
        guard let nameOfAssignment = nameInput.text, !nameOfAssignment.isEmpty else {
            errorOutput.text = "Enter All Values"
            return
        }
        
        guard let descriptionOfAssignment = descriptionInput.text, !descriptionOfAssignment.isEmpty else {
            errorOutput.text = "Enter All Values"
            return
        }
        
        guard let tasksForAssignmentAsString = taskInput.text, !tasksForAssignmentAsString.isEmpty else {
            errorOutput.text = "Enter All Values"
            return
        }
        
        guard let tasksForAssignment = Double(tasksForAssignmentAsString) else {
            errorOutput.text = "Enter All Values"
            return
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
