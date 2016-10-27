//
//  CollectionViewController.swift
//  test
//
//  Created by Mean Reaksmey on 10/27/16.
//  Copyright © 2016 reaksmey. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import FontAwesomeKit
private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController ,UICollectionViewDelegateFlowLayout {
    var dataJson = [JSON]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setCat()
        self.collectionView!.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        fetchDataFresh(nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width:self.view.frame.width, height: 300 )
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataJson.count
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = FreshNews(json: dataJson[indexPath.row])
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        cell.lbCat.isHidden = false
        cell.lbCat.text = data.category_name
        cell.lbTitle.text = data.title
        cell.lbDate.text = data.createDate
        
        kingfisherImage(cell.imgMain, Url: "http://54.201.189.220:3000/" + data.file_name!)
        
        return cell
        //        }
    }
    var apiURL = ""
    func setCat(){
        // ព័ត៌មានថ្មីៗ
        apiURL = "news/top?page=\(self.offset)&limit=10&sort=DESC"
    }
    
    
    var offset = 1
    // Get fresh news data
    func fetchDataFresh(_ handler: ((Void)-> Void)?)  {
        http.get(apiURL,parameter: [:]) { (success, json, headerJson) -> Void in
            if success{
                if (json?["data"].count)! > 0{
                    
                    if self.offset == 1{
                        self.dataJson = []
                    }
                    
                    for data in (json?["data"].array!)!{
                        self.dataJson.append(data)
                        print("======data", data)
                    }
                    self.offset += 1
                    self.setCat()
                    self.collectionView?.reloadData()
                }
            }
        }
    }

}
