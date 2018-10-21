//
//  UIColor+Extension.swift
//  OkBox
//
//  Created by Ivan Aldama on 21/10/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        self.init(red:r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
