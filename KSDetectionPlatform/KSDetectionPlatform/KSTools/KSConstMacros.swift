//
//  KSConstMacros.swift
//  DYPSwift
//
//  Created by kris on 2016/11/18.
//  Copyright © 2016年 kris. All rights reserved.
//

import Foundation
import UIKit


/// In Swift the situation is the same - there are no headers and no macros so there is also no precompiled header. Use extensions, global constants or singletons instead.


// MARK: - SERVICE & SecurityPolicy
let TestEnvironment   = true //测试环境
let SanboxEnvironment = false//沙盒环境
let OnlineEnvironment = false//正式环境

var HOME_URL: String?
#if TestEnvironment
    let HOME_URL = "http://192.168.0.140:8013"
#elseif SanboxEnvironment
    let HOME_URL = "http://jiancetwo.sandbox.guchewang.com"
#elseif OnlineEnvironment
    let HOME_URL = "http://jctwo.guchewang.com"
#endif

/// 超时时间
let kTimeOut         = 15.0
/// 加密秘钥（通用秘钥+获取地区秘钥）
let kSalt            = "3CEA5FCD-451F-4B97-87B6-A2C6C7C8A5FD"
let kSaltArea        = "2CB3147B-D93C-964B-47AE-EEE448C84E3C"
let kToken           = "6"
let kTokenArea       = "1"
/// 平台
let kPlantType       = "2"
/// API版本号
let kAPIVersion      = "100"
/// 应用名称
let kClient          = "KSDetectionPlatform"


// MARK: - THIRD SDK APPKEY & APPSECREAT
let kUMAppKey        = "575cbe5467e58e1257001ebb"
let kUMAppSecret     = ""
let kWeChatAppID     = "wx9c75b0133621563d"
let kWeChatAppSecret = ""
let kWeChatPartnerId = "1362952402"
let kWeChatAPIKey    = "d7d854681460c87401e3d5f277a3ed51"
let kQQAppID         = ""
let kQQAppKey        = ""
let kBaiduMapKey     = "mfFr21BSXTtNSG9KKK1TBP07ELIdVcWX"

#if __OPTIMIZE__
let kALiYunKey        = "OupNoSqjIHVpZGlx"
let kALiYunSecret     = "qabDsPKm0MBHWRJOmp45cu0BhSABt2"
let kALiYunEndpoint   = "http://oss-cn-beijing.aliyuncs.com"
let kALiYunBucketName = "ooto"
#else
let kALiYunKey        = "BTRtaCAFU85ZVERS"
let kALiYunSecret     = "QTzPmz5QSouGr6GYfAPC7klcloszDE"
let kALiYunEndpoint   = "http://oss-cn-beijing.aliyuncs.com"
let kALiYunBucketName = "ootodayu"
#endif


// MARK: - DEVICE INFO
let kSysVersion     = (UIDevice.current.systemVersion as NSString).floatValue
let kDevice         = "ios"
let kDeviceUUID     = UIDevice.current.identifierForVendor?.uuidString
let kDeviceUserName = UIDevice.current.name


// MARK: - APP INFO
let kAppBundleID      = Bundle.main.bundleIdentifier
let kAppName          = Bundle.main.infoDictionary?["CFBundleDisplayName"]
let kAppVersion       = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
let kAppBundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"]


// MARK: - APP FRAME
let kStatusBarHeight: CGFloat = 20.0
let kNavBarHeight: CGFloat    = 44.0
let kTabBarHeight: CGFloat    = 49.0
let kAppHeight: CGFloat       = UIScreen.main.bounds.size.height
let kAppWidth: CGFloat        = UIScreen.main.bounds.size.width


// MARK: - TEXT FONT
let kTextFont     = "Helvetica"
let kTextBoldFont = "Helvetica-Bold"


// MARK: - NSUSERDEFAULTS
let USERDEFAULT = UserDefaults.standard


// MARK: - COMMON COLOR
let CUTTING_LINE_COLOR = RGBVCOLOR(0xEEEEEE)
let CUTTING_LINE_HEIGHT: CGFloat = UIScreen.main.scale == 2 ? 0.5 : 0.34




