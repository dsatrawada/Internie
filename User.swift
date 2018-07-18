//
//  User.swift
//  Internie
//
//  Created by Katie YK So on 7/18/18.
//  Copyright © 2018 InternFinder. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class User {
    
    // MARK: - Properties
    
    let uid: String
    let name: String
//    let email: String
//    let phone: String
//    let website: String
//    let zipcode: String
 
    
    
    // MARK: - Init
    
    init(uid: String, name: String
//        , email: String, phone: String, website: String, zipcode: String
        )  {
        self.uid = uid
        self.name = name
//        self.email = email
//        self.phone = phone
//        self.website = website
//        self.zipcode = zipcode

    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let name = dict["name"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.name = name
        
    }
    
    
}
