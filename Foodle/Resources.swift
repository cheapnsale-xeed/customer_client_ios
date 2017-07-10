//
//  SystemValues.swift
//  Foodle
//
//  Created by devcraft50 on 26/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import UIKit


struct ColorRes {

    static let colorBlack = UIColor.black
    static let colorWhite = UIColor.white
    static let colorPointRed = UIColor(rgb:0xbb0551)
    static let colorPointBlack = UIColor(rgb:0x151515)
    static let colorGray = UIColor(rgb:0xa7a7a7)
    static let colorGrayMapStore = UIColor(argb:0x99000000)
    static let colorGrayBar = UIColor(rgb:0xc7c7c7)
    static let colorDarkRed = UIColor(rgb:0xbc0f24)
    static let colorDisable = UIColor(rgb:0xececec)
    static let colorDiableBack = UIColor(rgb:0xa3a3a3)
    static let colorYamiGreen = UIColor(rgb:0x22a057)
    static let colorDeepYamiGreen = UIColor(rgb:0x118055)
    static let colorTransparent = UIColor(argb:0x00000000)
    static let colorLightSeaGreen = UIColor(rgb:0x3cbe73)
    static let colorPastelRed = UIColor(rgb:0xe65555)
    static let colorLightGray = UIColor(rgb:0x716F6F)
    static let colorLighterGray = UIColor(argb:0xbe716f6f)
    static let colorDisabledBlack = UIColor(argb:0x40000000)
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
    
    // let's suppose alpha is the first component (ARGB)
    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF
        )
    }
}


extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}

