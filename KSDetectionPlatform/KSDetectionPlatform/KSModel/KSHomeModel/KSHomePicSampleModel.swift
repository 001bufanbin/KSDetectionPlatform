//
//  KSHomePicSampleModel.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/30.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

/// 主页拍摄示例List实体
class KSHomePicSampleListModel: KSBaseModel {
    var KSList: Array<KSHomePicSampleModel>?
}

/// 拍摄样例实体
class KSHomePicSampleModel: KSBaseModel {
    var ID: Int?
    var Description: String?
    var Title: String?
    var PictureUrl:String?
}
