//
//  jobPostService.swift
//  Internie
//
//  Created by Katie YK So on 7/19/18.
//  Copyright © 2018 InternFinder. All rights reserved.
//

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

struct JobPostService {
    
    static func create (_ firUser: FIRUser, jobtitle: String, jobdescription: String, skills:
        [Bool], completion: @escaping (Employer?) -> Void) {
        
        let postDict = ["jobtitle": jobtitle,
                        "jobdescription": jobdescription,
                        "skills": skills] as [String : Any]
        
        let ref = Database.database().reference().child("Post").child(firUser.uid)
        
        //writing to the Firebase
        ref.setValue(postDict) { (error, ref) in
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
