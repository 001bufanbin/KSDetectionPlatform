//
//  KSServiceTool.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/9.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSServiceTool: NSObject {


    class func sortDic(dicSort: Dictionary<String, Any>) -> Dictionary<String, Any> {
        var dicResult: Dictionary<String, Any> = [:]
        dicResult = dicSort

        //userId
        if KSGlobal.share.isLogin() {
            dicResult["userId"] = KSGlobal.share.userModel?.userId
        }
        //tokenid
        dicResult["tokenid"]     = kToken
        //platType
        dicResult["platType"]    = kPlantType
        //equipmentNo
        dicResult["equipmentNo"] = kDeviceUUID
        //telephone
        if KSGlobal.share.userModel?.Telephone?.isEmpty == false {
            dicResult["telephone"] = KSGlobal.share.userModel?.Telephone
        }

        return dicResult
    }

}
