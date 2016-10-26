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


class DetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbClock: UILabel!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    var dataDetail:JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail News"
        
        print("============ test",dataDetail)
//        let data = 
        let data = FreshNews(json: dataDetail!)
        self.lbTitle.text = data.title! + "រសៀល​ថ្ងៃទី ១៩ ខែកញ្ញា តារសៀល​ថ្ងៃទី ១៩ ខែកញ្ញា តារសៀល​ថ្ងៃទី ១៩ ខែកញ្ញា តារសៀល​ថ្ងៃទី"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
