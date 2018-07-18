//
//  JobPostViewController.swift
//  Internie
//
//  Created by Andrew Busel on 7/18/18.
//  Copyright © 2018 InternFinder. All rights reserved.
//

import Foundation
import UIKit
class JobPostViewController: UIViewController {
    @IBOutlet weak var jobPostNavigationBar: UINavigationBar!
    @IBOutlet weak var jobDescriptionView: UIView!
    @IBOutlet weak var jobDescriptionText: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyWebsiteLabel: UILabel!
    @IBOutlet weak var companyAddressLabel: UILabel!
    @IBOutlet weak var companyCityAndStateLabel: UILabel!
    @IBOutlet weak var skillRequiredLabel: UILabel!
    @IBOutlet weak var companyZipLabel: UILabel!
    func setUpViews(){
        jobDescriptionView.layer.borderWidth = 1
        jobDescriptionView.layer.borderColor = UIColor.black
        jobPostNavigationBar.text = "Job Title"
        companyNameLabel.text = "Company Name"
        companyWebsiteLabel.text = "Company Website"
        companyAddressLabel.text = "Company Address Line 1"
        skillRequiredLabel.text = "Language Required"
        jobDescriptionText.text = "Job Bio"
    }
    
}
