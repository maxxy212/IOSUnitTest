//
//  PersonDetailViewController.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 09/04/2022.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var favColor: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var peopleData: PeopleData? {
      didSet {
          refreshUI()
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adddIdentifiers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if peopleData == nil {
            hideUI()
        }else{
            showUI()
        }
    }
    
    private func refreshUI() {
        loadViewIfNeeded()
        if peopleData == nil {
            hideUI()
        }else{
            showUI()
        }
        imageView.setImageWithURL(url: (peopleData?.avatar)!)
        name.text = "Name: \((peopleData?.firstName)!) \((peopleData?.lastName)!)"
        email.text = "Email: \(peopleData?.email ?? "")"
        jobTitle.text = "Job Title: \(peopleData?.jobtitle ?? "")"
        favColor.text = "Favorite Color: \(peopleData?.favouriteColor ?? "")"
    }
    
    private func hideUI() {
        imageView.isHidden = true
        name.isHidden = true
        email.isHidden = true
        jobTitle.isHidden = true
        favColor.isHidden = true
    }
    
    private func showUI() {
        imageView.isHidden = false
        name.isHidden = false
        email.isHidden = false
        jobTitle.isHidden = false
        favColor.isHidden = false
    }
    
    private func adddIdentifiers() {
        view.accessibilityIdentifier = "PersonDetailView"
        name.accessibilityIdentifier = "nameLabel"
        jobTitle.accessibilityIdentifier = "jobTitleLabel"
        favColor.accessibilityIdentifier = "favColorLabel"
        imageView.accessibilityIdentifier = "imageView"
    }

}
