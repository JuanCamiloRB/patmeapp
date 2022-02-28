//
//  BreedTableViewCell.swift
//  patmeapp
//
//  Created by Juan Camilo on 18/01/22.
//

import UIKit

class BreedTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var breedLbl: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
