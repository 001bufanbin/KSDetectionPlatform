//
//  KSHomeService.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/29.
//  Copyright © 2017年 kris. All rights reserved.
//

import Foundation

// MARK: - 获取首页信息接口
struct KSHomeService: KSBaseService {

    let path:String = "/Api/Banner/HomeInfo"

    typealias ResponseModel = KSHomeModel
}

// MARK: - 获取首页拍摄样例接口
struct KSHomePicSampleService: KSBaseService {

    var type: String

    let path:String = "/App/config/getphotocaption.ashx"

    var parameter: Dictionary<String, Any> {
        return ["type":type]
    }

    typealias ResponseModel = KSHomePicSampleListModel
}
