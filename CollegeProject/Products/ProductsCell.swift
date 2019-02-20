//
//  ProductsCell.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 11/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

protocol ProductCellDelegate : class {
    func didTapAddButton(productId:String)
    func didTapMinusButton(productId:String)
}

class ProductsCell: UITableViewCell {
    let arr : [db] = []
    let cartArray : [db] = []
    var productId : String!
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var quantityDisplayLabel: UILabel!
    @IBOutlet weak var quantityView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    weak var delegate:ProductCellDelegate?
    
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

    func populateWith(product : [String:Any]) {
        
        productId = product["productID"] as? String
        let imageUrl = product["imageUrl"] as! String
        //image load code here
        Alamofire.request(imageUrl).responseImage { response in
            if let image1 = response.result.value {
                self.productImage.image = image1
            }
            if let rate = product["rate"] {
                self.productPrice.text = "\(rate)/kg"
            }
            self.productName.text = product["name"] as? String
        
        }
        
        let quantity = ProductList.getQuantity(productId: productId)
        if quantity > 0 {
            quantityDisplayLabel.text = "\(quantity)"
            addToCartButton.isHidden = true
            quantityView.isHidden = false
        }
        else {
            quantityDisplayLabel.text = ""
            addToCartButton.isHidden = false
            quantityView.isHidden = true
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        delegate?.didTapAddButton(productId: productId)
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        delegate?.didTapMinusButton(productId: productId)
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        addToCartButton.isHidden = true
        quantityView.isHidden = false
        delegate?.didTapAddButton(productId: productId)
    }
}
