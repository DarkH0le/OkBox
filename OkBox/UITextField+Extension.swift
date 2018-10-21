//
//  UITextField+Extension.swift
//  OkBox
//
//  Created by Ivan Aldama on 21/10/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import Foundation
import  UIKit

extension UITextField {
    func setLeftPaddin(padding: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setBottonBorder(){
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
