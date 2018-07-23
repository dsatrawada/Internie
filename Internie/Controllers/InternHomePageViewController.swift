//
//  File.swift
//  Internie
//
//  Created by Andrew Busel on 7/18/18.
//  Copyright © 2018 InternFinder. All rights reserved.


import Foundation
import UIKit
class InternHomePageViewController: UITableViewController{

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "potentialInternshipCell", for: indexPath) as! ListPotentialInternshipCell
        cell.internShipTitleLabel.text = "Job Title for Company Name"
        return cell
    }
}
