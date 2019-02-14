//
//  FeaturedProductCell.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 12/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit

class FeaturedProductCell: UICollectionViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DispatchQueue.main.async {
            self.baseView.layer.cornerRadius = 5
            let shadowPath = UIBezierPath(rect: self.baseView.bounds).cgPath
            let shadowColor = UIColor.darkGray.withAlphaComponent(0.1)
            
            self.baseView.addShadowWith(shadowPath: shadowPath, shadowColor: shadowColor.cgColor, shadowOpacity: 1.0, shadowRadius: 10, shadowOffset: CGSize(width: 3, height: 3))
            
        }
    }

}
