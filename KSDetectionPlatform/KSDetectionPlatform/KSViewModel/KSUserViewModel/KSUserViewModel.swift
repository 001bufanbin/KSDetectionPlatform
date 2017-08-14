//
//  KSUserViewModel.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/14.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit


class KSUserViewModel: KSBaseViewModel {

    // MARK: - 用户相关请求单例
    static let share = KSUserViewModel ()
    private override init() {
        super.init()
    }


    //MARK: - 登录请求
    ///
    /// - Parameters:
    ///   - userName: 用户名
    ///   - pwd: 密码
    ///   - success: 成功回调
    ///   - failure: 失败回调
    func login(userName:String,
               pwd:String,
               success:@escaping successBlock,
               failure:@escaping failureBlock) -> Void {
        let loginService = KSLoginService(userName: userName, pwd: pwd)
        self.loadRequest(service: loginService, success: { (request, json) in
            success(request, json)
        }, failure: { (request, error) in
            failure(request, error)
        })
    }


    

}
