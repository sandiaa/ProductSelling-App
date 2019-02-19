//
//  Database.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 19/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import Foundation
import UIKit

class DatabaseArray {
    func returnData() -> [db] {
    var dbArray : [db] = []
        let value1 = db(proId: 0, vegName: "Brinjal1", vegImage:#imageLiteral(resourceName: "2") , vegPrice: 35.00)
    dbArray.append(value1)
        let value2 = db(proId: 1, vegName: "Brinjal2", vegImage:#imageLiteral(resourceName: "1") , vegPrice: 70.00)
    dbArray.append(value2)
        let value3 = db(proId: 2, vegName: "Brinjal3", vegImage:#imageLiteral(resourceName: "2") , vegPrice: 36.00)
    dbArray.append(value3)
        let value4 = db(proId: 3, vegName: "Brinjal4", vegImage:#imageLiteral(resourceName: "1") , vegPrice: 71.00)
    dbArray.append(value4)
        let value5 = db(proId: 4, vegName: "Brinjal5", vegImage:#imageLiteral(resourceName: "2") , vegPrice: 35.00)
    dbArray.append(value5)
        let value6 = db(proId: 5, vegName: "Brinjal2", vegImage:#imageLiteral(resourceName: "1") , vegPrice: 70.00)
    dbArray.append(value6)
        let value7 = db(proId: 6, vegName: "Brinjal3", vegImage:#imageLiteral(resourceName: "2") , vegPrice: 36.00)
    dbArray.append(value7)
        let value8 = db(proId: 7, vegName: "Brinjal4", vegImage:#imageLiteral(resourceName: "1") , vegPrice: 71.00)
    dbArray.append(value8)
    return dbArray
    }
}
struct db {
    var proId : Int
    var vegName : String
    var vegImage : UIImage
    var vegPrice : Float
        
}
