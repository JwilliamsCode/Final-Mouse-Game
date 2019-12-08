//
//  Extensions.swift
//  Mouse Game
//
//  Created by Justin Williams on 12/8/19.
//  Copyright © 2019 Justin Williams. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let universalGreen = UIColor(hex: 0x55EFC4)
    static let universalDeepGreen = UIColor(hex: 0x00b894)
    
    static let universalBlue = UIColor(hex: 0x74b9ff)
    static let universalDeepBlue = UIColor(hex: 0x0984e3)
    
    static let universalRed = UIColor(hex: 0xff7675)
    static let universalDeepRed = UIColor(hex: 0xd63031)
    
    static let universalGray = UIColor(hex: 0x34495e)
    
    static let universalYellow = UIColor(hex: 0xf1c40f)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0){
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a)
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
        
}
