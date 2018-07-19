//
//  CreateJobPostViewController.swift
//  Internie
//
//  Created by Divya Satrawada on 7/18/18.
//  Copyright © 2018 InternFinder. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class CreateJobPostViewController: UIViewController{
    
    @IBOutlet weak var EmployerJobDescriptionField: UITextView!
    @IBOutlet weak var CPlusPlusSwitch: UISwitch!
    @IBOutlet weak var PythonSwitch: UISwitch!
    @IBOutlet weak var JavaSwitch: UISwitch!
    @IBOutlet weak var JobPostSaveButton: UIBarButtonItem!
    @IBOutlet weak var SwiftSwitch: UISwitch!
    @IBOutlet weak var EmployerJobTitle: UITextField!
    
    // index 0: swift
    // index 1: Java
    // index 2: python
    // index 3: C++
    
    
    
    @IBAction func SaveJobPostTapped(_ sender: UIBarButtonItem) {
        
        var skills = [false, false, false, false]
        
       guard let firUser = Auth.auth().currentUser,
        let jobtitle = EmployerJobTitle.text,
        !jobtitle.isEmpty,
        let jobdescription = EmployerJobDescriptionField.text,
        !jobdescription.isEmpty
            else {
                print("we have no users")
                return }
        
        
        if SwiftSwitch.isOn {
            skills[0] = true
        }
        else{
            skills[0] = false
        }
        
        if JavaSwitch.isOn {
            skills[1] = true
        }
        else{
            skills[1] = false
        }
        
        if PythonSwitch.isOn {
            skills[2] = true
        }
        else{
            skills[2] = false
        }
        
        if CPlusPlusSwitch.isOn {
            skills[3] = true
        }
        else{
            skills[3] = false
        }
        
        
  
        JobPostService.create(firUser, jobtitle: jobtitle, jobdescription: jobdescription, skills: skills) { (user) in
            guard let user = user else { return }
            
            
            print("Created new post")
        }
    }
  
    
    
}
