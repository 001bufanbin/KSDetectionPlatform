//
//  KSUserService.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/10.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

// MARK: - 登录接口
struct KSLoginService: KSBaseService {
    
    var userName: String
    var pwd: String

    let path:String = "/App/UserHandler.ashx"

    var parameter: Dictionary<String, Any> {
        return ["lgcode":userName, "pwd":pwd, "op":"login"]
    }
    //var response: Any
}


