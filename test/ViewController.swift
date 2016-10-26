//
//  ViewController.swift
//  test
//
//  Created by Mean Reaksmey on 10/25/16.
//  Copyright © 2016 reaksmey. All rights reserved.
//

import UIKit
import FlowingMenu
import FontAwesomeKit
import PageMenu

var mainViewController = ViewController()
class ViewController: UIViewController, FlowingMenuDelegate, UITableViewDelegate {
    let flowingMenuTransitionManager = FlowingMenuTransitionManager()
    var menu: UIViewController?
    let PresentSegueName = "PresentMenuSegue"
    let DismissSegueName = "DismissMenuSegue"
    let CellName         = "UserContactCell"
    
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    
    let mainColor      = UIColor(hex: 0x804C5F)
    let derivatedColor = UIColor(hex: 0x794759)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainViewController = self
        
        flowingMenuTransitionManager.setInteractivePresentationView(view)
        flowingMenuTransitionManager.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: fontAwesomeToImage(FAKFontAwesome.barsIcon(withSize: 20),size: 20), style: .plain, target: self, action: #selector(self.menuAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: fontAwesomeToImage(FAKFontAwesome.searchIcon(withSize: 20),size: 20), style: .plain, target: self, action: #selector(self.searchAction))
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        imageView.image = UIImage(named: "logoYNN")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        self.navigationItem.titleView = imageView
        
        setPageMenu()
        
    }
    let freshNews = TableViewController(nibName: "CommonTableViewController", bundle: nil)
    let freshNews1 = TableViewController(nibName: "CommonTableViewController", bundle: nil)
    
    var pageMenu : CAPSPageMenu?
    
    func setPageMenu(){
        
        var controllerArray : [UIViewController] = []
        // Initialize view controllers to display and place in array
        
        //        popNew.title = "popular"
        
        freshNews.title = "fresh news"
        controllerArray.append(freshNews)
        
        freshNews1.title = "new news"
        controllerArray.append(freshNews1)
        
//        let new = storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
//        popNew.title = "new"
//        controllerArray.append(new)
        
        // Initialize scroll menu
        let parameters: [CAPSPageMenuOption] = [
            //            .menuItemFont(setFontWithNida(16)),
            .menuItemSeparatorWidth(4.3),
            .scrollMenuBackgroundColor(UIColor.white),
            .viewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
            .bottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
            .selectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .menuMargin(20.0),
            .menuHeight(40.0),
            .selectedMenuItemLabelColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .unselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorRoundEdges(true),
            .selectionIndicatorHeight(2.0),
            .menuItemSeparatorPercentageHeight(0.1)
        ]
        
        let rect = CGRect(x: 0.0, y: 60, width: self.view.frame.width, height: self.view.frame.height)
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: rect, pageMenuOptions: parameters)
        self.view.addSubview((pageMenu?.view)!)
    }
    //set seguement to call other UIView
    func menuAction(){
        self.performSegue(withIdentifier: "PresentMenuSegue", sender: nil)
    }
    func searchAction(){
        self.performSegue(withIdentifier: "PresentMenuSegue", sender: nil)
    }
    
    // FontAwesomeKit UIBarButtonItem
    func fontAwesomeToImage(_ icon: FAKIcon, size:CGFloat = 15, color:UIColor = UIColor.white)->UIImage{
        let cogIcon = icon
        cogIcon.addAttribute(NSForegroundColorAttributeName, value: color)
        let iconImg = cogIcon.image(with: CGSize(width: size, height: size))
        return iconImg!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PresentSegueName {
            let vc                   = segue.destination
            vc.transitioningDelegate = flowingMenuTransitionManager
            
            flowingMenuTransitionManager.setInteractiveDismissView(vc.view)
            
            menu = vc
        }
    }
    
    @IBAction func unwindToMainViewController(_ sender: UIStoryboardSegue) {
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func colorOfElasticShapeInFlowingMenu(_ flowingMenu: FlowingMenuTransitionManager) -> UIColor? {
        return mainColor
    }
    
    func flowingMenuNeedsPresentMenu(_ flowingMenu: FlowingMenuTransitionManager) {
        performSegue(withIdentifier: PresentSegueName, sender: self)
    }
    
    func flowingMenuNeedsDismissMenu(_ flowingMenu: FlowingMenuTransitionManager) {
        menu?.performSegue(withIdentifier: DismissSegueName, sender: self)
    }
    
}
