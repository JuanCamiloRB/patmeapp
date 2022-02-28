//
//  MDCChipCollectionViewCell.swift
//  patmeapp
//
//  Created by Juan Camilo on 24/01/22.
//

import UIKit
import MaterialComponents.MaterialChips

class MDCChipCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let chipView = MDCChipView()
        chipView.titleLabel.text = "Tap me"
        chipView.setTitleColor(UIColor.red, for: .selected)
        chipView.sizeToFit()
        self.view.addSubview(chipView)
    }

}
