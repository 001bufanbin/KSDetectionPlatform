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


/**
 *  Common Color
 *
 */
let CUTTING_LINE_COLOR = RGBVCOLOR(0xEEEEEE)

let CUTTING_LINE_HEIGHT: CGFloat = UIScreen.main.scale == 2 ? 0.5 : 0.34




