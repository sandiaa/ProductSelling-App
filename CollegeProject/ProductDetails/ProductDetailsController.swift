//
//  ProductDetailsController.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 13/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit
import Hero

class ProductDetailsController: UIViewController {

    @IBOutlet weak var imgProduct: UIImageView!
    
    var myHeroId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        
        self.hero.isEnabled = true
        imgProduct.hero.id = myHeroId
        
        self.hero.modalAnimationType = .selectBy(presenting:.slide(direction: .left), dismissing:.zoomOut)

    }

}
