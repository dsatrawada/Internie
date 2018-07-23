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
        guard let user = authDataResult?.user
            else { return }
        
        let userRef = Database.database().reference().child("users").child(user.uid)
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let user = Employer(snapshot: snapshot) {
                print("Welcome back, \(user.username).")
                
            } else {
                if let vc = UIStoryboard(name: "Registration", bundle: .main).instantiateInitialViewController() {
                    //present(vc, animated: true, completion: nil)
                    self.present(vc, animated: true, completion: nil)
                }
                
            }
        })
        
        print("handle user signup / login")
        
        return
    }
}



