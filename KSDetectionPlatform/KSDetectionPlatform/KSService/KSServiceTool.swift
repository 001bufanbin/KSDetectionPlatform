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
        guard dicSort.isEmpty else {
            return dicResult
        }
        dicResult = dicSort
        dicResult["tokenid"]     = kToken
        dicResult["platType"]    = kPlantType
        dicResult["equipmentNo"] = kDeviceUUID
        
        return dicResult
    }

}
