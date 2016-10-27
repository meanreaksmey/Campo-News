//
//  DetailViewController.swift
//  test
//
//  Created by Mean Reaksmey on 10/26/16.
//  Copyright © 2016 reaksmey. All rights reserved.
//

import UIKit
import FontAwesomeKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Cosmos

class DetailViewController: UIViewController,UIWebViewDelegate {
    
    
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbClock: UILabel!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imgAdvertise: UIImageView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var btnShare: UIButton!
    
    private var timer: Timer?
    var dataDetail:JSON?
    var url = "http://54.201.189.220:3000/"
    let screenSize: CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail News"
        
//        print("============ test",dataDetail)
        
                      self.webView.scrollView.isScrollEnabled = false
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.05, target:self, selector:#selector(self.fetch), userInfo:nil, repeats:true)
        

        
        //        self.scrollView.alpha = 0
        // flixibleHeight with webview
        scrollView.autoresizingMask =  UIViewAutoresizing.flexibleHeight
        rateStar()
        fontButton()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let data = FreshNews(json: dataDetail!)
        self.lbTitle.text = data.title!
        kingfisherImage(self.imgImage, Url:url + data.file_name!)
        self.lbDate.text = data.uploadDate
        
        self.webView.loadHTMLString(data.detailData(), baseURL: nil)
    }
    
    func fontButton(){
        let cogIconDrop = FAKFontAwesome.shareAltIcon(withSize: 30)
        let leftLandscapeImageDrop = cogIconDrop?.image(with: CGSize(width: 25, height: 25))
        btnShare.setImage(leftLandscapeImageDrop, for: .normal)
        btnShare.tintColor=UIColor.white
    }
    func rateStar(){
        cosmosView.rating = 4
        cosmosView.didFinishTouchingCosmos = { rating in }
        cosmosView.didTouchCosmos = { rating in }
        
        // Show only fully filled stars
        cosmosView.settings.fillMode = .full
        // Other fill modes: .half, .precise
        
        // Change the size of the stars
        cosmosView.settings.starSize = 22
        
        // Set the distance between stars
        cosmosView.settings.starMargin = 5
        
        // Set the color of a filled star
        cosmosView.settings.filledColor = UIColor.orange
        
        // Set the border color of an empty star
        cosmosView.settings.emptyBorderColor = UIColor.orange
        
        // Set the border color of a filled star
        cosmosView.settings.filledBorderColor = UIColor.orange
        
    }
    func fetch() {
        DispatchQueue.main.async{
            self.webView.frame.size.height = 1
            self.webView.frame.size.height = self.webView.sizeThatFits(CGSize.zero).height
            self.scrollView.contentSize = CGSize(width: self.screenSize.width, height: self.webView.frame.size.height + self.imgAdvertise.frame.size.height + self.lbTitle.frame.size.height + self.lbDate.frame.size.height + 400)
            self.viewHeight.constant = self.scrollView.contentSize.height
            
        }
    }
    
    var countFrame = 0
    func webViewDidFinishLoad(_ webView: UIWebView) {
        countFrame -= 1
        if countFrame == 0{
            delay(3, closure: (timer?.invalidate)!)
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView){
        countFrame += 1
        print("webViewDidStartLoad", webView.frame.height, countFrame)
        //            self.webView.loadHTMLString("", baseURL: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
