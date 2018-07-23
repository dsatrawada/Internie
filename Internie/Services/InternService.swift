//
//  InternService.swift
//  Internie
//
//  Created by Divya Satrawada on 7/19/18.
//  Copyright © 2018 InternFinder. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth.FIRUser

struct InternService {
    
    static func createIntern (_ firUser: FIRUser, username: String,  age: Bool, phone: String, zip: String, swift: Bool, java: Bool, python: Bool, cpp: Bool, github: String, projects: String, completion: @escaping (Intern?) -> Void) {
        let userDict = ["username": username,
                        "age": age,
                        "phoneNum": phone,
                        "zipcode": zip,
                        "swift": swift,
                        "java": java,
                        "python": python,
                        "cpp": cpp,
                        "github": github,
                        "projects": projects] as [String : Any]
        
        let ref = Database.database().reference().child("intern").child(firUser.uid)
        
        //writing to the Firebase
        ref.setValue(userDict) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        }
        
        
        //get the datasnapshot
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let user = Intern(snapshot: snapshot)
            completion(user)
        })
        
        
    }
    
    
}
