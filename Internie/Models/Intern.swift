//
//  Intern.swift
//  Internie
//
//  Created by Divya Satrawada on 7/19/18.
//  Copyright © 2018 InternFinder. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class Intern {
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    let age: Bool
    let phone: String
    let zipcode: String
    let swift: Bool
    let java: Bool
    let python: Bool
    let cpp: Bool
    let github: String
    let projects: String
    
    // MARK: - Init
    
    init(uid: String, username: String, age: Bool, phone: String, zipcode: String, swift: Bool, java: Bool, python: Bool, cpp: Bool, github: String, projects: String)  {
        self.uid = uid
        self.username = username
        self.age = age
        self.phone = phone
        self.zipcode = zipcode
        self.swift = swift
        self.java = java
        self.python = python
        self.cpp = cpp
        self.github = github
        self.projects = projects
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String,
            let age = dict["age"] as? Bool,
            let phone = dict["phone"] as? String,
            let zipcode = dict["zipcode"] as? String,
            let swift = dict["swift"] as? Bool,
            let java = dict["java"] as? Bool,
            let python = dict["python"] as? Bool,
            let cpp = dict["cpp"] as? Bool,
            let github = dict["github"] as? String,
            let projects = dict["projects"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
        self.age = age
        self.phone = phone
        self.zipcode = zipcode
        self.swift = swift
        self.java = java
        self.python = python
        self.cpp = cpp
        self.github = github
        self.projects = projects
    }
    
    
}
