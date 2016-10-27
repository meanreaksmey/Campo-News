//
//  NewsCollectionViewCell.swift
//  YNN
//
//  Created by Tun Sopheak on 9/21/16.
//  Copyright © 2016 Nanita Tech CO., LTD. All rights reserved.
//

import UIKit
import FontAwesomeKit

class NewsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lbClock: UILabel!
    @IBOutlet weak var lbCat: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var imgPlay: UIImageView!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var viewCatWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Clock Icon
        fontAwsomeToLabel(lbClock, icon: FAKFontAwesome.clockOIcon(withSize: 20))
        lbClock.textColor = UIColor(hex: 0x297CB1)

        lbCat.font = setFontWithNida(14)
        lbTitle.font = setFontWithNida(15)
        lbDate.font = setFontWithNida(12)
        imgPlay.isHidden = false
    }
}
