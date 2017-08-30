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
