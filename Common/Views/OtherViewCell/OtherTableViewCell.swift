//
//  OtherTableViewCell.swift
//  patmeapp
//
//  Created by Juan Camilo on 28/12/21.
//

import UIKit

class OtherTableViewCell: UITableViewCell {

    @IBOutlet weak var iconCheck: UIImageView!
    @IBOutlet weak var lblPet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
