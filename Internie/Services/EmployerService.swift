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
    
    static func createEmployer (_ firUser: FIRUser, username: String, phone: String, addr: String, city: String, state: String, zip: String, website: String, completion: @escaping (Employer?) -> Void) {
        let userDict = ["username": username,
                        "phoneNum": phone,
                        "address": addr,
                        "city": city,
                        "state": state,
                        "zipcode": zip,
                        "website": website]
        
        let ref = Database.database().reference().child("employer").child(firUser.uid)
        
        //writing to the Firebase
        ref.setValue(userDict) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        }
    
        
        //get the datasnapshot
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let user = Employer(snapshot: snapshot)
            completion(user)
        })
        
        
        
    }
    
    
}
