//
//  Function.swift
//  YNN
//
//  Created by Rat Mengheang on 9/20/16.
//  Copyright © 2016 Nanita Tech Co., LTD. All rights reserved.
//

import Foundation
import FontAwesomeKit
import Kingfisher

var detail:String?
// FontAwesomeKit Image in icon
func fontAwesomeToImage(_ mainImg:UIImageView, icon: FAKIcon, size:CGSize = CGSize(width: 35, height: 32), color:UIColor = UIColor.white){
    
    let cogIcon = icon
    cogIcon.addAttribute(NSForegroundColorAttributeName, value: color)
    let iconImg = cogIcon.image(with: size)
    mainImg.image = iconImg
}

// FontAwesomeKit UIBarButtonItem
func fontAwesomeToImage(_ icon: FAKIcon, size:CGFloat = 15, color:UIColor = UIColor.white)->UIImage{
    
    let cogIcon = icon
    cogIcon.addAttribute(NSForegroundColorAttributeName, value: color)
    let iconImg = cogIcon.image(with: CGSize(width: size, height: size))
    return iconImg!
}

// FontAwesomeKit Label to Icon
func fontAwsomeToLabel(_ label:UILabel, icon:FAKIcon){
    let clock = FAKFontAwesome.clockOIcon(withSize: 25)
    clock?.addAttribute(NSForegroundColorAttributeName, value: UIColor(hex: 0x297CB1))
    label.attributedText = icon.attributedString()
}

// set font
func setFontWithNida(_ size:CGFloat = 17)->UIFont{
    return UIFont(name: "NiDASowannaphum", size: size)!
}

// Add Advertise
//func instanceFromNib(_ name:String, uView: UIView) -> UIView {
//    return UINib(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! uView
//}


//var numOfSection: NSInteger = 0
//if dataJson.count > 0 {
//    self.collectionView?.backgroundView = nil
//    numOfSection = 1
//} else {
//    
//    //            create view as background for addSubview vReload
//    let vForReload: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.collectionView!.bounds.size.width, height: self.collectionView!.bounds.size.height))
//    vReload.btnReload.addTarget(self, action: #selector(self.reloadData), for: .touchUpInside)
//    vForReload.addSubview(vReload)
//    self.collectionView?.backgroundView = vForReload

func addViewLoading(collectionView: UICollectionView) -> UICollectionView {
    //            create view as background for addSubview vReload
        let vForReload: UIView = UIView(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height))
        collectionView.backgroundView = vForReload
    return vForReload as! UICollectionView
}


// top view
func topMostController() -> UIViewController {
    var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
    while (topController.presentedViewController != nil) {
        topController = topController.presentedViewController!
    }
    return topController
}

// check Valid url
func verifyUrl (_ urlString: String?) -> Bool {
    //Check for nil
    if let urlString = urlString {
        // create NSURL instance
        if let url = NSURL(string: urlString) {
            //            print("------------url", url)
            // check if your application can open the NSURL instance
            return UIApplication.shared.canOpenURL(url as URL)
        }
    }
    return false
}

// kingfisher
func kingfisherImage(_ img : UIImageView, Url : String, _ loading: Bool = true, _ placeholderImage: String = "imageLoading"){
    //    print("kingfisher ==========", imageUrl + Url)
    if Url != "" {
        if verifyUrl(Url) {
            var url = URL(string: Url)!
            if findHTTP(Url) {
                url = URL(string: Url)!
            }
            img.kf_setImage(with: url,
                            placeholder:  UIImage(named: placeholderImage),
                            options: [.transition(.fade(1))],
                            progressBlock: nil,
                            completionHandler: nil)
            
        }else{
            img.image =  UIImage(named: placeholderImage)
        }
    }
    else{
        img.image =  UIImage(named: placeholderImage)
    }
}


// find http://
func findHTTP(_ url:String)->Bool{
    if url.range(of: ("http://")) != nil{
        
        return true
    }
    return false
}

// delay
func delay(_ seconds: Int, closure: @escaping ()->()) {
    let time = DispatchTime.now() + .seconds(seconds)
    DispatchQueue.main.asyncAfter(deadline: time) {
        closure()
    }
}

// animation
func animate(_ duration:TimeInterval, closure: @escaping ()->()){
    UIView.animate(withDuration: duration, animations: {
        closure()
    })
}
