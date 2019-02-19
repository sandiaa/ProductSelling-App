//
//  Products.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 19/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import Foundation

class ProductList {
    class func getAllProducts()->[[String:Any]] {
        var arr = [[String:Any]]()
        let productIDs = ["1","2","3","4","5","6","7","8","9","10"]
        let prodcutNames = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
        let productRate = [10,10,10,10,10,10,10,10,10,10]
        let productImages = ["https://www.vegetables.co.nz/assets/vegetables/_resampled/FillWyI0MDAiLCIzMDAiXQ/capsicums.png",
                             "https://www.vegetables.co.nz/assets/vegetables/_resampled/FillWyI0MDAiLCIzMDAiXQ/capsicums.png",
                             "https://www.vegetables.co.nz/assets/vegetables/_resampled/FillWyI0MDAiLCIzMDAiXQ/capsicums.png",
                             "https://www.vegetables.co.nz/assets/vegetables/_resampled/FillWyI0MDAiLCIzMDAiXQ/capsicums.png",
                             "https://www.vegetables.co.nz/assets/vegetables/_resampled/FillWyI0MDAiLCIzMDAiXQ/capsicums.png",
                             "https://www.vegetables.co.nz/assets/vegetables/_resampled/FillWyI0MDAiLCIzMDAiXQ/capsicums.png",
                             "https://www.vegetables.co.nz/assets/vegetables/_resampled/FillWyI0MDAiLCIzMDAiXQ/capsicums.png",
                             "https://www.vegetables.co.nz/assets/vegetables/_resampled/FillWyI0MDAiLCIzMDAiXQ/capsicums.png",
                             "https://www.vegetables.co.nz/assets/vegetables/_resampled/FillWyI0MDAiLCIzMDAiXQ/capsicums.png",
                             "https://www.vegetables.co.nz/assets/vegetables/_resampled/FillWyI0MDAiLCIzMDAiXQ/capsicums.png"]
        let productDescription = ["qwertyuiop",
                                  "qwertyuiop",
                                  "qwertyuiop",
                                  "qwertyuiop",
                                  "qwertyuiop",
                                  "qwertyuiop",
                                  "qwertyuiop",
                                  "qwertyuiop",
                                  "qwertyuiop",
                                  "qwertyuiop",]
        
        for i in 0..<productIDs.count {
            let dict:[String:Any] = ["productID":productIDs[i],
                                    "name":prodcutNames[i],
                                    "rate":productRate[i],
                                    "imageUrl":productImages[i],
                                    "description":productDescription[i]]
            arr.append(dict)
        }
        return arr
    }
}
