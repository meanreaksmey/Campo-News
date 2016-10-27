//
//  VideoDetailViewController.swift
//  YNN
//
//  Created by Tun Sopheak on 9/22/16.
//  Copyright © 2016 Nanita Tech CO., LTD. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
import SwiftyJSON

var videoDetail = VideoDetailViewController()

class VideoDetailViewController: UIViewController ,YTPlayerViewDelegate {
    var dataJSON:JSON?
    
    var videoID: String?
    @IBOutlet var vBehind: UIView!
    @IBOutlet weak var vdoH: NSLayoutConstraint!
    
    //    var player: XCDYouTubeVideoPlayerViewController? = nil
    
    @IBOutlet weak var playerView: YTPlayerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoDetail = self
        navigationItem.title = "news detail"
        vdoH.constant = self.view.frame.size.height / 2 - 80
        playerView.delegate = self
        playerView.alpha = 0
        vBehind.alpha = 0
    }
    
    func playYouTube() {
        DispatchQueue.main.async {
            let data = VideoListModel(json: self.dataJSON!)
            self.playVideo(data.youtubeID)
        }
    }
    
    func playVideo(_ videoID:String?){
        playerView.load(withVideoId: videoID!, playerVars: ["playsinline":"1", "controlls":"1", "showinfo":"1"])
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchDataVisited(nil)
        
    }
    override func viewDidAppear(_ animated: Bool) {
//        let data = VideoListModel(json: self.dataJSON!)
//        animate(0.5, closure: {
//            self.playerView.alpha = 1
//            self.vBehind.alpha = 1
//        })
//        self.playVideo(data.youtubeID)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        playerView.stopVideo()
    }
    
    func fetchDataVisited(_ handler: ((Void)-> Void)?)  {
        //     apiURL for Video ID
//        let apiUrlID = "view/count/\(videoID!)"
//        http.get(apiUrlID,parameter: [:]) { (success, json, headerJson) -> Void in
//            if success{
//            }
//            handler?()
//        }
    }
    
}









