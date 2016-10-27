//
//  TableViewController.swift
//  test
//
//  Created by Mean Reaksmey on 10/25/16.
//  Copyright © 2016 reaksmey. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

var table = TableViewController()
class TableViewController: UITableViewController {
    let screenSize: CGRect = UIScreen.main.bounds
    override func viewDidLoad() {
        super.viewDidLoad()
        setCat()
        fetchDataFresh(nil)
        
        table = self
        self.tableView.register(UINib(nibName: "NibTableViewCell", bundle: nil), forCellReuseIdentifier: "NibTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("==============",indexPath)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.dataDetail =  dataJson[indexPath.row]
        mainViewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataJson.count
    }
    var apiURL = ""
    func setCat(){
        // ព័ត៌មានថ្មីៗ
        apiURL = "news/top?page=\(self.offset)&limit=10&sort=DESC"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("=========viewDidAppear")
    }
    
    
    
    var dataJson = [JSON]()
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
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NibTableViewCell", for: indexPath) as! NibTableViewCell
        
        let data = FreshNews(json: dataJson[indexPath.row])
        cell.lbInfo.text = data.title
        kingfisherImage(cell.imgPhoto, Url:"http://54.201.189.220:3000/" + data.file_name!)
        return cell
        
    }
    func kingfisherImage(_ img : UIImageView, Url : String, _ loading: Bool = true, _ placeholderImage: String = "imageLoading"){
        print("kingfisher ==========", imageUrl + Url)
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
    func findHTTP(_ url:String)->Bool{
        if url.range(of: ("http://")) != nil{
            
            return true
        }
        return false
    }
    
}




