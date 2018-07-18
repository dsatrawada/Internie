//
//  RegistrationEmployerViewController.swift
//  Internie
//
//  Created by Divya Satrawada on 7/17/18.
//  Copyright © 2018 InternFinder. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegistrationEmployerViewController: UIViewController {
    @IBOutlet weak var CreateEmployerButton: UIButton!
    @IBOutlet weak var EmployerNameField: UITextField!
    @IBOutlet weak var EmployerEmailField: UITextField!
    @IBOutlet weak var EmployerAddressField: UITextField!
    
    @IBOutlet weak var EmployerWebsiteField: UITextField!
    @IBOutlet weak var EmployerZipCodeField: UITextField!
    @IBOutlet weak var EmployerStateField: UITextField!
    @IBOutlet weak var EmployerCityField: UITextField!
    @IBOutlet weak var EmployerPhoneField: UITextField!
    @IBAction func CreateEmployerButtonTapped(_ sender: UIButton) {
        
        
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        
        // 2
        let userAttrs = ["username": username]
        
        // 3
        let ref = Database.database().reference().child("users").child(firUser.uid)
        
        // 4
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return
            }
            
            // 5
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                
                // handle newly created user here
            })
        }
        
        
    }
}
