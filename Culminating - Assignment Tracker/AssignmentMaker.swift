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
    
    @IBOutlet var dateInput: UITextField!
    
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
        
        guard let tasksOfAssignmentAsString = taskInput.text, !tasksOfAssignmentAsString.isEmpty else {
            errorOutput.text = "Enter All Values"
            return
        }
        
        guard let tasksOfAssignment = Int(tasksOfAssignmentAsString) else {
            errorOutput.text = "Enter All Values"
            return
        }
        
        guard let dateOfAssignmentAsString = dateInput.text, !dateOfAssignmentAsString.isEmpty else {
            errorOutput.text = "Enter All Values"
            return
        }
        
        guard let dateOfAssignment = Int(dateOfAssignmentAsString) else {
            errorOutput.text = "Enter All Values"
            return
        }
        
        let newAssignment = Assignment(name: nameOfAssignment, description: descriptionOfAssignment, tasks: tasksOfAssignment, date: dateOfAssignment)
        
        delegate?.save(new: newAssignment)
        
        self.navigationController?.popViewController(animated: true)
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
