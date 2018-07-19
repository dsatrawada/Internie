//
//  EmployerService.swift
//  Internie
//
//  Created by Shingade on 7/19/18.
//  Copyright © 2018 InternFinder. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth.FIRUser

struct EmployerService {
    
    func createEmpolyer (_ firUser: FIRUser, username: String, phone: String, addr: String, city: String, state: String, zip: String, website: String, completion: @escaping (User?) -> Void) {
        let usernamesDict = ["username": username]
        let userPhoneNumDict = ["phoneNum": phone]
        let userAddressDict = ["address": addr]
        let userCityDict = ["city": city]
        let userStateDict = ["state": state]
        let userZipcodeDict = ["zipcode": zip]
        let userWebsiteDict = ["website": website]
        
        let ref = Database.database().reference().child("users").child(firUser.uid)
        
        //writing to the Firebase
        ref.setValue(usernamesDict) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        }
        ref.setValue(userPhoneNumDict) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        }
        ref.setValue(userAddressDict) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        }
        ref.setValue(userCityDict) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        }
        ref.setValue(userStateDict) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        }
        ref.setValue(userZipcodeDict) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        }
        ref.setValue(userWebsiteDict) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        }
        
        //get the datasnapshot
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let user = User(snapshot: snapshot)
            completion(user)
        })
        
        
    }
    
    
}
