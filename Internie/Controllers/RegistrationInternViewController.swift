//
//  RegistrationInternViewController.swift
//  Internie
//
//  Created by Divya Satrawada on 7/17/18.
//  Copyright © 2018 InternFinder. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegistrationInternViewController: UITableViewController {
    @IBOutlet weak var InternNameField: UITextField!
    @IBOutlet weak var InternAgeSwitch: UISwitch!
    @IBOutlet weak var InternPhoneField: UITextField!
    @IBOutlet weak var InternZipCodeField: UITextField!
    @IBOutlet weak var InternSwiftSwitch: UISwitch!
    @IBOutlet weak var InternJavaSwitch: UISwitch!
    @IBOutlet weak var InternPythonSwitch: UISwitch!
    @IBOutlet weak var InternCPPSwitch: UISwitch!
    @IBOutlet weak var InternGitHubField: UITextField!
    @IBOutlet weak var InternProjectsField: UITextField!
    @IBOutlet weak var CreateInternButton: UIButton!
    
    static var skillsOfIntern = [false, false, false, false]
    @IBAction func createInternButtonTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
            let username = InternNameField.text,
            !username.isEmpty,
            
            let phone = InternPhoneField.text,
            !phone.isEmpty,
            
            let zip = InternZipCodeField.text,
            !zip.isEmpty,
            
            let github = InternGitHubField.text,
            !github.isEmpty,
        
            let projects = InternProjectsField.text,
            !projects.isEmpty
            
            else { return }
        
        let age = InternAgeSwitch.isOn
        let swift = InternSwiftSwitch.isOn
        let java = InternJavaSwitch.isOn
        let python = InternPythonSwitch.isOn
        let cpp = InternCPPSwitch.isOn
        
        InternService.createIntern(firUser, username: username, age: age, phone: phone, zip: zip, swift: swift, java: java, python: python, cpp: cpp, github: github, projects: projects) { (user) in
            
            guard let user = user else { return }
            
        
            
            print("Created new user: \(user.username)")
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
        
    }
}
