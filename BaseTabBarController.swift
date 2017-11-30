

//
//  BaseTabBarController.swift
//  YKLive
//
//  Created by Mr_Jia on 2017/11/16.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addChildViewControllers(viewController: HomeViewController(), title: "Home", image: "home", selectImage: "home_select")
        addChildViewControllers(viewController: MessageViewController(), title: "Message", image: "message", selectImage: "message_select")
        addChildViewControllers(viewController: SearchViewController(), title: "Search", image: "search", selectImage: "search_select")
        addChildViewControllers(viewController: MineViewController(), title: "Mine", image: "me", selectImage: "me_select")
    }
    func addChildViewControllers(viewController:UIViewController,title:String,image:String,selectImage:String) {
        
//        viewController.title = title;
        viewController.view.backgroundColor = .white
        let baseNavController = BaseNavController.init(rootViewController: viewController)
//        baseNavController.tabBarItem.title = title
        baseNavController.tabBarItem.image = UIImage(named: image)
        baseNavController.tabBarItem.selectedImage = UIImage(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        baseNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        self.addChildViewController(baseNavController)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
