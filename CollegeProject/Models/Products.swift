//
//  Products.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 19/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import Foundation
import UIKit
import CoreData

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
    
    
    class func getQuantity(productId:String)->Int {
        let appDelegate =
            UIApplication.shared.delegate as? AppDelegate
        
        let managedContext =
            appDelegate!.persistentContainer.viewContext
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
        request.predicate = NSPredicate(format: "id = %@", productId)
        
        do {
            let result = try managedContext.fetch(request)
            if result.count == 1 {
                for data in result as! [NSManagedObject] {
                    print(data.value(forKey: "quantity") as! Int)
                    return (data.value(forKey: "quantity") as! Int)
                }
            }
        } catch {
            print("Failed")
            return 0
        }
        return 0
    }
}
