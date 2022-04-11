//
//  RoomViewCell.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 09/04/2022.
//

import UIKit

class RoomViewCell: UITableViewCell {

    @IBOutlet weak var roomID: UILabel!
    @IBOutlet weak var maximumOccupants: UILabel!
    @IBOutlet weak var isOccupied: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension RoomViewCell {
    func applyAccessibilty(_ roomData: RoomData) {
        roomID.isAccessibilityElement = true
        roomID.accessibilityTraits = .none
        roomID.accessibilityLabel = "User Identity"
        roomID.accessibilityValue = "\(roomData.id ?? "")"
        roomID.font = .preferredFont(forTextStyle: .body)
        roomID.adjustsFontForContentSizeCategory = true
        
        maximumOccupants.isAccessibilityElement = true
        maximumOccupants.accessibilityTraits = .none
        maximumOccupants.accessibilityLabel = "Maximum Occupancy"
        maximumOccupants.accessibilityValue = "\(roomData.maxOccupancy ?? 0)"
        maximumOccupants.font = .preferredFont(forTextStyle: .body)
        maximumOccupants.adjustsFontForContentSizeCategory = true
        
        isOccupied.isAccessibilityElement = true
        isOccupied.accessibilityTraits = .none
        isOccupied.accessibilityLabel = "Is room occupied"
        isOccupied.accessibilityValue = "\(roomData.isOccupied ?? false)"
        isOccupied.font = .preferredFont(forTextStyle: .body)
        isOccupied.adjustsFontForContentSizeCategory = true
    }
}
