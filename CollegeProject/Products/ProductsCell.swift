//
//  ProductsCell.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 11/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit

class ProductsCell: UITableViewCell {
    
    var quantity : Int = 0
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var quantityDisplayLabel: UILabel!
    @IBOutlet weak var quantityView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       addToCartButton.layer.cornerRadius = 10
        plusButton.layer.cornerRadius = 10
        minusButton.layer.cornerRadius = 10
        productImage.layer.cornerRadius = 10
        productImage.layer.masksToBounds = true
        
        let shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 130), cornerRadius: 10)
        let shadowColor = UIColor.black.withAlphaComponent(0.3)
        
        baseView.layer.cornerRadius = 10.0
        baseView.addShadowWith(shadowPath: shadowPath.cgPath, shadowColor: shadowColor.cgColor, shadowOpacity: 0.5, shadowRadius: 5, shadowOffset: CGSize(width: 0, height: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        quantity = quantity+1
        quantityDisplayLabel.text = String(quantity)
        
      
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        
        quantity = quantity-1
        quantityDisplayLabel.text = String(quantity)
        if quantity == 0 || quantity < 0 {
            quantityDisplayLabel.text = "0"
            addToCartButton.isHidden = false
            quantityView.isHidden = true
        }
      
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        addToCartButton.isHidden = true
        quantityView.isHidden = false
    }
}
