//
//  KSGlobal.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/16.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSGlobal: NSObject {

    // MARK: - Property
    /// 保存本地的用户数据key
    let kUserModel:String = "kUserModel"


    /// 登陆成功存储的用户数据
    private var _userModel:KSUserModel?
    var userModel:KSUserModel? {
        get {
            if _userModel != nil {
                return _userModel
            } else {
                _userModel = KSUserModel.deserialize(from: USERDEFAULT.string(forKey: kUserModel))
                return _userModel
            }
        }
        set {
            _userModel = newValue
            USERDEFAULT.set(_userModel?.toJSONString(), forKey: kUserModel)
            USERDEFAULT.synchronize()
        }
    }


    // MARK: - APP通用数据单例
    static let share = KSGlobal ()
    private override init() {
        super.init()
    }

    // MARK: - Function
    /// 是否已登录
    ///
    /// - Returns: 登录状态
    func isLogin() -> Bool {
        return (userModel?.userId == nil) ? false : true
    }

}
