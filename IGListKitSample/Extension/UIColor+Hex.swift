//
//  UIColor+Hex.swift
//  IGListKitSample
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import UIKit

extension UIColor {
    /**
     16進数表記でUIColor
     - parameter hex:   (例) #FF00FF
     - parameter alpha: アルファ値(0.0~1.0)
     - returns: UIColor
     */
    public convenience init(hexInt: Int, alpha: CGFloat) {
        let r = CGFloat((hexInt & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hexInt & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hexInt & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    /**
     16進数表記でUIColor
     - parameter hex:   (例) #FF00FF
     - parameter alpha: アルファ値(0.0~1.0)
     - returns: UIColor
     */
    public convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexStr = hex.replacingOccurrences(of: "[^0-9a-fA-F]", with: "", options: .regularExpression, range: nil)
        var color: UInt32 = 0
        Scanner(string: hexStr).scanHexInt32(&color)
        self.init(hexInt: Int(color), alpha: alpha)
    }
    /// 16進表記
    var hexString: String? {
        return self.cgColor.hexString
    }
    /// RGBa
    var RGBaHex: (red: Int, green: Int, blue: Int, alpha: CGFloat)? {
        return self.cgColor.RGBaHex
    }
    /// RGBa
    var RGBa: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        return self.cgColor.RGBa
    }
    
    /**
     色の平均をとる
     - parameter color1: 色1
     - parameter color2: 色2
     - returns: (色1 + 色2) / 2
     */
    static func average(color1:UIColor,color2:UIColor) -> UIColor {
        return (color1 + color2) / 2.0
    }
    
    /**
     色を混ぜる
     - parameter color1:      色1
     - parameter color1Ratio: 色1の比率(0.0~1.0)
     - parameter color2:      色2
     - returns: (色1 * ratio) + (色2 * (1-ratio))
     */
    static func convine(color1:UIColor,color1Ratio:CGFloat,color2:UIColor) -> UIColor {
        let color2Ratio : CGFloat = 1.0 - color1Ratio
        return color1 * color1Ratio + color2 * color2Ratio
    }
}

extension CGColor {
    var hexString: String? {
        if let x = self.RGBaHex {
            let hex = x.red * 0x10000 + x.green * 0x100 + x.blue
            return NSString(format:"%06x", hex) as String
        } else {
            return nil
        }
    }
    var RGBaHex: (red: Int, green: Int, blue: Int, alpha: CGFloat)? {
        guard let cs = self.colorSpace,
            let x = self.components else { return nil }
        if cs.model == .rgb {
            let r: Int = Int(x[0] * 255.0)
            let g: Int = Int(x[1] * 255.0)
            let b: Int = Int(x[2] * 255.0)
            let a: CGFloat = x[3]
            return (r, g, b, a)
        } else {
            return nil
        }
    }
    
    var RGBa: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        guard let cs = self.colorSpace,
            let x = self.components else { return nil }
        if cs.model == .rgb {
            let r: CGFloat = x[0]
            let g: CGFloat = x[1]
            let b: CGFloat = x[2]
            let a: CGFloat = x[3]
            return (r, g, b, a)
        } else {
            return nil
        }
    }
}

func + (left:UIColor,right:UIColor) -> UIColor {
    if let c1 = left.RGBa , let c2 = right.RGBa {
        return UIColor(
            red: (CGFloat(c1.red) + CGFloat(c2.red)),
            green: (CGFloat(c1.green) + CGFloat(c2.green)),
            blue: (CGFloat(c1.blue) + CGFloat(c2.blue)),
            alpha: (c1.alpha + c2.alpha))
    }else {
        return left
    }
}

func - (left:UIColor,right:UIColor) -> UIColor {
    if let c1 = left.RGBa , let c2 = right.RGBa {
        return UIColor(
            red: (CGFloat(c1.red) - CGFloat(c2.red)),
            green: (CGFloat(c1.green) - CGFloat(c2.green)),
            blue: (CGFloat(c1.blue) - CGFloat(c2.blue)),
            alpha: (c1.alpha - c2.alpha))
    }else {
        return left
    }
}

func / (left:UIColor,right:CGFloat) -> UIColor {
    if let c1 = left.RGBa {
        return UIColor(
            red: CGFloat(c1.red) / right,
            green: CGFloat(c1.green) / right,
            blue: CGFloat(c1.blue) / right,
            alpha: c1.alpha / right)
    }
    return left
}

func * (left:UIColor,right:CGFloat) -> UIColor {
    if let c1 = left.RGBa {
        return UIColor(
            red: CGFloat(c1.red) * right,
            green: CGFloat(c1.green) * right,
            blue: CGFloat(c1.blue) * right,
            alpha: c1.alpha * right)
    }
    return left
}
