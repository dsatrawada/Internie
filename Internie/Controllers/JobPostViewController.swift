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
    @IBOutlet weak var emailCompanyButton: UIButton!
    let companyEmail = "Company Email Address"
    let companyName = "Company Name"
    let requiredLanguage = "Swift"
    func setUpViews(){
        jobDescriptionView.layer.borderWidth = 1
        jobDescriptionView.layer.borderColor = UIColor.black
        jobPostNavigationBar.text = "Job Title"
        companyNameLabel.text = companyName
        companyWebsiteLabel.text = "Company Website Address"
        companyAddressLabel.text = "Company Address Line 1"
        companyCityAndStateLabel.text = ("City" + ", State")
        companyZipLabel.text = "Company Zip Code"
        skillRequiredLabel.text = ("Requires: " + \(requiredLanguage))
        jobDescriptionText.text = "Job Bio"
        emailCompanyButton.titleLabel?.text = ("Email "+ \(companyName))
    }
    @IBAction func sendEmail(sender: UIButton) {
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients(companyEmail)
        mailVC.setSubject("RE: Internie Interest")
        mailVC.setMessageBody("Dear \(companyName),", isHTML: false)
        
        presentViewController(mailVC, animated: true, completion: nil)
    }
    
}