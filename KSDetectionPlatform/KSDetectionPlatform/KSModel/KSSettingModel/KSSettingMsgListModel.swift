//
//  KSSettingMsgListModel.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/31.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSSettingMsgListModel: KSBaseModel {
    var PageIndex: String?
    var PageSize: String?
    var TotalCount: String?
    var List: Array<KSMsgModel>?
}

class KSMsgModel: KSBaseModel {
    var TaskID: Int?
    var OrderStatus: Int?
    var OrderType: Int?
    var TaskVersion: Int?
    var Content: String?
    var Title: String?
    var ID: Int?
    var CreateTime: Int?
}
