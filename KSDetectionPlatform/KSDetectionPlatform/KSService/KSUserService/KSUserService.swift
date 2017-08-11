//
//  KSUserService.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/10.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

final class KSUserService: KSBaseService {
    static let shareInstance = KSUserService()
    private override init() { super.init() }


    func login(userName:String,
               pwd:String,
               success:@escaping successBlock,
               failure:@escaping failureBlock) -> Void {
        let parameter:Dictionary<String, Any> = ["lgcode":userName, "pwd":pwd, "op":"login"]
        let url = HOME_URL+"/App/UserHandler.ashx"
        let  service = KSUserService.shareInstance
        request = service.postRequest(url: url, parameters: parameter, success: { (request, json) in
            success(request, json)
        }, failure: { (request, error) in
            failure(request, error)
        })

    }
}
