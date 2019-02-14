//
//  UIView+Extension.swift
//  CollegeProject
//
//  Created by Sandiaa on 12/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addShadowWith(shadowPath:CGPath, shadowColor:CGColor, shadowOpacity:Float, shadowRadius:CGFloat, shadowOffset:CGSize) {
        layer.masksToBounds = true
        layer.shadowColor = shadowColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        clipsToBounds = false
        layer.shadowPath = shadowPath
    }
}
