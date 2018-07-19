//
//  User.swift
//  Internie
//
//  Created by Katie YK So on 7/18/18.
//  Copyright © 2018 InternFinder. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class Employer {
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    //let email: String
    let phone: String
    let website: String
    let zipcode: String
    let address: String
    let city: String
    let state: String
    
    
    // MARK: - Init
    
    init(uid: String, username: String, phone: String, addr: String, city: String, state: String, zip: String, website: String
        )  {
        self.uid = uid
        self.username = username
        self.phone = phone
        self.address = addr
        self.city = city
        self.state = state
        self.zipcode = zip
        self.website = website

    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String,
            let phone = dict["phone"] as? String,
            let address = dict["address"] as? String,
            let city = dict["city"] as? String,
            let state = dict["state"] as? String,
            let zipcode = dict["zipcode"] as? String,
            let website = dict["website"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
        self.phone = phone
        self.address = address
        self.city = city
        self.state = state
        self.zipcode = zipcode
        self.website = website
    }
    
    
}
