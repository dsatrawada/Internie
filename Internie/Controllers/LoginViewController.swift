//
//  LoginViewController.swift
//  Internie
//
//  Created by Andrew Busel on 7/17/18.
//  Copyright © 2018 InternFinder. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase
typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
      
        
        
        print("i was tapped")
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
        
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        if let vc = UIStoryboard(name: "RegistrationEmployer", bundle: .main).instantiateInitialViewController() {
            present(vc, animated: true, completion: nil)
        }
        print("handle user signup / login")
        
        return
    }
}

func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
    if let error = error {
        assertionFailure("Error signing in: \(error.localizedDescription)")
        return
    }
    
    // 1
    guard let user = authDataResult?.user
        else { return }
    
    // 2
    let userRef = Database.database().reference().child("users").child(user.uid)
    
    // 3
    userRef.observeSingleEvent(of: .value, with: { (snapshot) in
        if let user = Employer(snapshot: snapshot) {
            print("Welcome back, \(user.username).")
            
        } else {
            print("New user!")
            
        }
    })
}

