//
//  TabViewController.swift
//  FaFr
//
//  Created by Sandiaa on 11/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        tabBar.tintColor = UIColor(red: 51/255, green: 102/255, blue: 0/255, alpha: 1)
        setupTabBar()
    }
    
    func setupTabBar() {
        
        let productsController = createNavController(vc: HomeController(), selected: #imageLiteral(resourceName: "profileLight-2"), unselected: #imageLiteral(resourceName: "profileLight-1"))
      
       let ordersController = createNavController(vc: OrdersController(), selected: #imageLiteral(resourceName: "ordersDark"), unselected: #imageLiteral(resourceName: "ordersLight"))
         let cartController = createNavController(vc: CartController(), selected: #imageLiteral(resourceName: "cartFilled"), unselected: #imageLiteral(resourceName: "cartEmpty"))
        let profileController = createNavController(vc: ProfileController(), selected: #imageLiteral(resourceName: "profileDark"), unselected: #imageLiteral(resourceName: "profileLight"))
        
        viewControllers = [productsController,ordersController,cartController,profileController]
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        }
    }
    
}

extension UITabBarController {
    
    func createNavController(vc: UIViewController, selected: UIImage, unselected: UIImage) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
      
        return navController
    }
}

