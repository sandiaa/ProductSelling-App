//
//  ProductDetailsController.swift
//  CollegeProject
//
//  Created by Sandiaa on 13/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit
import Hero

class ProductDetailsController: UIViewController {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var pricePerKg: UILabel!
    @IBOutlet weak var pricePer2Kg: UILabel!
    @IBOutlet weak var deliveryEstimation: UILabel!
    @IBOutlet weak var featuredView: UIView!
    
    var myHeroId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let featured:FeaturedView = Bundle.main.loadNibNamed("FeaturedView", owner: self, options: nil)![0] as! FeaturedView
        featured.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
        
       
        featuredView.addSubview(featured)
        tabBarController?.tabBar.isHidden = true
        
        self.hero.isEnabled = true
        imgProduct.hero.id = myHeroId
        
        self.hero.modalAnimationType = .selectBy(presenting:.slide(direction: .left), dismissing:.zoomOut)

    }

    @IBAction func backButton(_ sender: UIButton) {

        self.dismiss(animated: true, completion: nil)
    }
}
