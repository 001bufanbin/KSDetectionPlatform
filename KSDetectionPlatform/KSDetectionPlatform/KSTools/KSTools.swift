//
//  KSTools.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/7/20.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSTools: NSObject {
    
    class func setFont(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: kTextFont, size: fontSize)!
    }
    
    class func setBoldFont(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: kTextBoldFont, size: fontSize)!
    }
    
}
