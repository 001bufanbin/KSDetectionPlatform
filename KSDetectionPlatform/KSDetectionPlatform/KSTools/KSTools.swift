//
//  KSTools.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/7/20.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

/**
 *
 *
 *
 */

func LOADIMAGE(_ named: String) -> UIImage {
    let imgPath = Bundle.main.path(forResource: named, ofType: "")
    return UIImage(contentsOfFile: imgPath!)!
    
//    NSString *path =  [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"login.png"];
//    BGimageView.image = [UIImage imageWithContentsOfFile:path];
}

/**
 *  RGBCOLOR
 *  RGBCOLOR(100, 100, 100)
 *  RGBACOLOR(100, 100, 100, 0.5)
 *  RGBVCOLOR(0x029588)
 *
 */
func RGBCOLOR(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor
{
    return UIColor(red: (red)/255, green: (green)/255, blue: (blue)/255, alpha: 1)
}

func RGBACOLOR(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat , _ alpha: CGFloat) -> UIColor
{
    return UIColor(red: (red)/255, green: (green)/255, blue: (blue)/255, alpha: alpha)
}

func RGBVCOLOR(_ rgbValue: CLong) -> UIColor
{
    return UIColor(red: (CGFloat((rgbValue & 0xFF0000) >> 16))/255,
                   green: (CGFloat((rgbValue & 0xFF00) >> 8))/255,
                   blue: (CGFloat(rgbValue & 0xFF))/255,
                   alpha: 1)
}

func RGBVACOLOR(_ rgbValue: CLong, _ alpha: CGFloat) -> UIColor
{
    return UIColor(red: (CGFloat((rgbValue & 0xFF0000) >> 16))/255,
                   green: (CGFloat((rgbValue & 0xFF00) >> 8))/255,
                   blue: (CGFloat(rgbValue & 0xFF))/255,
                   alpha: alpha)
}

/**
 *  Font & BoldFont
 *  KSFont(14)
 *  KSBoldFont(14)
 *
 */
func KSFont(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: kTextFont, size: fontSize)!
}

func KSBoldFont(_ fontSize: CGFloat) -> UIFont {
    return UIFont(name: kTextBoldFont, size: fontSize)!
}

/**
 *  NSLOG (WHEN DUBUG DOES NOT OUTPUT)
 */
func printLog<T>(message: T,
              file: String = #file,
              fuc: String = #function,
              line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent) [\(fuc)] [Line \(line)] \(message)")
    #endif
}
