//
//  MDCChipCollectionViewCell.swift
//  patmeapp
//
//  Created by Juan Camilo on 24/01/22.
//

import UIKit
import MaterialComponents.MaterialChips
class MDCChipCollectionView: UICollectionViewCell {
   
    @IBOutlet weak var lbl: UILabel!
    let chipView = MDCChipView()
    override func awakeFromNib() {
        super.awakeFromNib()
       
        chipView.titleLabel.text = "Tap me"
        chipView.setTitleColor(UIColor.red, for: .selected)
        chipView.sizeToFit()
        
        // Initialization code
    }

}
