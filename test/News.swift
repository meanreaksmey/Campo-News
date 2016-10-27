//
//  News.swift
//  YNN
//
//  Created by Tun Sopheak on 9/27/16.
//  Copyright © 2016 Nanita Tech CO., LTD. All rights reserved.
//

import UIKit
import SwiftyJSON

class FreshNews: NSObject {
    var id:String?
    var title:String?
    var desc:String?
    var file_name:String?
    var category_name:String?
    var createDate:String?
    var uploadDate:String?
    var visited:String?
    
    init(json:JSON) {
        
        id = "\(json["id"])"
        title = "\(json["title"])"
        desc = "\(json["description"])"
        file_name = "\(json["file_name"])"
        //        category_name = "\(json["category_name"])".localized()
        createDate = "\(json["created_at"])"
        uploadDate = "\(json["updated_at"])"
        visited = "\(json["visited"])"
    }
    
    
    
    func detailData()->String{
        let temp = desc!//.replace(target: "height=", withString:"h").replace(target: "width=", withString: "w")
        let script = "<script async='async' src='https://www.googletagservices.com/tag/js/gpt.js'></script><script>var googletag = googletag || {};googletag.cmd = googletag.cmd || [];</script><script>googletag.cmd.push(function() {googletag.defineSlot('/152539028/112223', [300, 250], 'div-gpt-ad-1471494582112-0').addService(googletag.pubads());googletag.pubads().enableSingleRequest();googletag.enableServices();});</script>"
        
        let testLink = ""
        //<a href=\"http://www.w3schools.com/html/html_links.asp\">link test</a>"
        //<iframe width=\"100%\" src=\"https://www.youtube.com/embed/UyYXUc39010\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let style = "<style>body {line-height: 170%;font-family: \"Hanuman\",Arial,serif !important;font-size: 17px !important ;} img {width: 100%; !important;height: auto; !important;}</style>"
        let html = "<!DOCTYPE html><html><head><meta charset=\"utf-8\"><link href=\"https://fonts.googleapis.com/css?family=Hanuman\" rel=\"stylesheet\" type=\"text/css\">\(script)</head>\(style)<body>\(testLink)\(temp)\(testLink)</body></html>"
        return html
    }
}

    class VideoListModel: NSObject {
        
        var title:String?
        var file_name:String?
        var createDate:String?
        var uploadDate:String?
        var youtubeID:String?
        var id:String?
        var visited:String?
        init(json:JSON) {
            id = "\(json["id"])"
            title = "\(json["title"])"
            file_name = "\(json["file_name"])"
            createDate = "\(json["created_at"])"
            uploadDate = "\(json["updated_at"])"
            youtubeID = "\(json["link"])"
            visited = "\(json["visited"])"
        }
        
    }
    
    func findYoutubeID(_ st:String)->String{
        //    let index1 = st.index(st.endIndex, offsetBy: -11)
        //    let substring1 = st.substring(to: index1)
        let last4 = st.substring(from:st.index(st.endIndex, offsetBy: -11))
        return last4
}

