//
//  KSSettingService.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/30.
//  Copyright © 2017年 kris. All rights reserved.
//

import Foundation

//struct KSSettingService: KSBaseService {
//
//}

/// 获取消息数量接口
struct KSSettingMsgCountService: KSBaseService {

    let path:String = "/Api/redDot/GetStatus"

    typealias ResponseModel = KSSettingMsgCountModel
}


/// 获取消息列表接口
struct KSSettingMsgListService: KSBaseService {

    var pageIndex: String


    let path:String = "/Api/Message/Get"

    var parameter: Dictionary<String, Any> {
        return ["pageIndex":pageIndex]
    }

    typealias ResponseModel = KSSettingMsgListModel
}
