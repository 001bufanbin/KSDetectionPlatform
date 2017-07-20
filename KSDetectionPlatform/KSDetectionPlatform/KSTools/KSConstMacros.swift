//
//  KSConstMacros.swift
//  DYPSwift
//
//  Created by kris on 2016/11/18.
//  Copyright © 2016年 kris. All rights reserved.
//

import Foundation
import UIKit

/**
 *  SERVICE & SecurityPolicy
 *
 */

let kServerAddress =    "http://api.tests.dyw365.cn/Api/getway/client"//java测试地址
                        //"http://service.haixiaoshequ.com/Api/getway/client"//php测试地址
                        //"http://service.dyw365.cn/Api/getway/client"//正式地址
                        //"http://api.develop.dyw365.cn:3001/Api/getway/client"//java开发地址

let kH5ServerAddress =  "http://service.haixiaoshequ.com/Api/getway/routerweb"
let kSalt =             "5d315780c23a5a13ad195ea1344ec387"
let kTimeOut =          15.0
let kAPIVersion =       "100"
let kClient =           "DaYuWangClient"

/**
 *  THIRD SDK APPKEY & APPSECREAT
 *
 */
let kUMAppKey =         "575cbe5467e58e1257001ebb"
let kUMAppSecret =      ""
let kWeChatAppID =      "wx9c75b0133621563d"
let kWeChatAppSecret =  ""
let kWeChatPartnerId =  "1362952402"
let kWeChatAPIKey =     "d7d854681460c87401e3d5f277a3ed51"
let kQQAppID =          ""
let kQQAppKey =         ""
let kBaiduMapKey =      "mfFr21BSXTtNSG9KKK1TBP07ELIdVcWX"

#if __OPTIMIZE__
let kALiYunKey =        "OupNoSqjIHVpZGlx"
let kALiYunSecret =     "qabDsPKm0MBHWRJOmp45cu0BhSABt2"
let kALiYunEndpoint =   "http://oss-cn-beijing.aliyuncs.com"
let kALiYunBucketName = "ooto"
#else
let kALiYunKey =        "BTRtaCAFU85ZVERS"
let kALiYunSecret =     "QTzPmz5QSouGr6GYfAPC7klcloszDE"
let kALiYunEndpoint =   "http://oss-cn-beijing.aliyuncs.com"
let kALiYunBucketName = "ootodayu"
#endif

/**
 *  DEVICE INFO
 *
 */
let kSysVersion =       (UIDevice.current.systemVersion as NSString).floatValue
let kDevice =           "ios"
let kDeviceUUID =       UIDevice.current.identifierForVendor?.uuidString
let kDeviceUserName =   UIDevice.current.name

/**
 *  APP INFO
 *
 */
let kAppBundleID =      Bundle.main.bundleIdentifier
let kAppName =          Bundle.main.infoDictionary?["CFBundleDisplayName"]
let kAppVersion =       Bundle.main.infoDictionary?["CFBundleShortVersionString"]
let kAppBundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"]

/**
 *  APP FRAME
 *
 */
let kStatusBarHeight: CGFloat = 20.0
let kNavBarHeight: CGFloat =   44.0
let kTabBarHeight: CGFloat =    49.0
let kAppHeight: CGFloat =       UIScreen.main.bounds.size.height
let kAppWidth: CGFloat =        UIScreen.main.bounds.size.width

/**
 *  TextFont
 *
 */
let kTextFont =         "Helvetica"
let kTextBoldFont =     "Helvetica-Bold"

/**
 *  NSUSERDEFAULTS
 *
 */
let USERDEFAULT =       UserDefaults.standard


/************** function ****************/

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




