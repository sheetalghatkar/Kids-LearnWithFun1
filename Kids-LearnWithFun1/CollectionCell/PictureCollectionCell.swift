//
//  PictureCollectionCell.swift
//  Kids-LearnWithFun
//
//  Created by sheetal shinde on 15/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import UIKit

class PictureCollectionCell: UICollectionViewCell {    
//    @IBOutlet weak var lblCard: UILabel!
    @IBOutlet weak var imgViewCard: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgViewCard.contentMode = .scaleAspectFill
    }

}
