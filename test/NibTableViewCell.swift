//
//  NibTableViewCell.swift
//  test
//
//  Created by Mean Reaksmey on 10/26/16.
//  Copyright © 2016 reaksmey. All rights reserved.
//

import UIKit
import FontAwesomeKit

class NibTableViewCell: UITableViewCell {

    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var lbInfo: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        fontButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func fontButton(){
        let cogIconDrop = FAKFontAwesome.shareAltIcon(withSize: 30)
        let leftLandscapeImageDrop = cogIconDrop?.image(with: CGSize(width: 25, height: 25))
        btnShare.setImage(leftLandscapeImageDrop, for: .normal)
        btnShare.tintColor=UIColor.white
    }
    
}
