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
    
    @IBOutlet var descriptionOutput: UILabel!
    
    @IBOutlet var tasksOutput: UILabel!
    
    @IBOutlet var percentOutput: UILabel!
    
    @IBOutlet var taskbarOutput: UIProgressView!
    
    @IBOutlet var urgencyOutput: UILabel!
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
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
