//
//  BaseTabBarController.swift
//  AppStoreJsonAPIS
//
//  Created by 宋超 on 2019/7/7.
//  Copyright © 2019 宋超. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        viewControllers = [
            creatNavController(viewController: UIViewController(), title: "Apps", imageName: "apps"),
            creatNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            creatNavController(viewController: AppSearchController(), title: "Search", imageName: "search")
        ]
    }
    
    fileprivate func creatNavController(viewController:UIViewController,title:String,imageName:String) -> UIViewController {
        viewController.view.backgroundColor = .white
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.navigationBar.topItem?.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
}








//
//let todayViewController = UIViewController()
//todayViewController.view.backgroundColor = .white
//let todayNavController = UINavigationController(rootViewController: todayViewController)
//todayNavController.tabBarItem.title = "Today"
//todayNavController.navigationBar.prefersLargeTitles = true
//todayNavController.navigationBar.topItem?.title = "TODAY"
//todayNavController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")
//
//
//let redViewController = UIViewController()
//redViewController.view.backgroundColor = .white
//let redNavController = UINavigationController(rootViewController: redViewController)
//redNavController.tabBarItem.title = "App"
//redNavController.navigationBar.prefersLargeTitles = true
//redNavController.navigationBar.topItem?.title = "APPS"
//redNavController.tabBarItem.image = #imageLiteral(resourceName: "apps")
//
//let blackViewController = UIViewController()
//blackViewController.view.backgroundColor = .white
//let blackNavController = UINavigationController(rootViewController: blackViewController)
//blackNavController.tabBarItem.title = "Search"
//blackNavController.navigationBar.topItem?.title = "SEARCH"
//blackNavController.navigationBar.prefersLargeTitles = true
//blackNavController.tabBarItem.image = #imageLiteral(resourceName: "search")
