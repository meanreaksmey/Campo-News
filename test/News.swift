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

