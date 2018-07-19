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
            let username = EmployerNameField.text,
            !username.isEmpty,
            
            let email = EmployerEmailField.text,
            !email.isEmpty,
            
            let phone = EmployerPhoneField.text,
            !phone.isEmpty,
            
            let addr = EmployerAddressField.text,
            !addr.isEmpty,
            
            let city = EmployerCityField.text,
            !city.isEmpty,
            
            let state = EmployerStateField.text,
            !state.isEmpty,
            
            let zip = EmployerZipCodeField.text,
            !zip.isEmpty,
            
            let website = EmployerWebsiteField.text,
            !website.isEmpty else { return }
        
        
        EmployerService.createEmployer(firUser, username: username, phone: phone, addr: addr, city: city, state: state, zip: zip, website: website) { (user) in
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
