//
//  PeopleViewCell.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 09/04/2022.
//

import UIKit

class PeopleViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: VMUIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension PeopleViewCell {
    func applyAccessibilty(_ peopleData: PeopleData) {
        profileImage.accessibilityTraits = .image
        profileImage.accessibilityLabel = "The user is \(peopleData.firstName ?? "") \(peopleData.lastName ?? ""), the email is \(peopleData.email ?? ""), the job title is \(peopleData.jobtitle ?? "") and the favorite color is \(peopleData.favouriteColor ?? "")"
        
        nameLabel.isAccessibilityElement = true
        nameLabel.accessibilityTraits = .none
        nameLabel.accessibilityLabel = "User Name"
        nameLabel.accessibilityValue = "\(peopleData.firstName ?? "") \(peopleData.lastName ?? "")"
        nameLabel.font = .preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
    }
}
