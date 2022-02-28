//
//  OnBoardingCell.swift
//  PatMe
//
//  Created by Juan Camilo on 3/12/21.
//

import UIKit

class OnBoardingCell: UICollectionViewCell {
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var continueBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
