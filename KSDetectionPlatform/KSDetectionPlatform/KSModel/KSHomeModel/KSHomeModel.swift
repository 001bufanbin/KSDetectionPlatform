//
//  KSHomeModel.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/29.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit


/// 主页实体
class KSHomeModel: KSBaseModel {
    var TaskCount: KSHomeTaskCountModel?
    var Banner: Array<KSHomeBannerModel>?
    var Statistic: KSHomeStatisticModel?
}

///////////////主页实体-包含的实体/////////////
/// 主页任务数量实体
class KSHomeTaskCountModel: KSBaseModel {
    var BackCount: String?
    var EvaluatingCount: String?
    var CloseCount: String?
    var SignInCount: String?
}

/// 主页轮播实体
class KSHomeBannerModel: KSBaseModel {
    var ID: Int?
    var BannerValue: String?
    var Name: String?
    var Remark: String?
    var PicUrl: String?
    var BannerType: Int?
}

/// 主页统计实体
class KSHomeStatisticModel: KSBaseModel {
    var Today: KSHomeStatisticDayModel?
    var YesterDay: KSHomeStatisticDayModel?
    var Week: KSHomeStatisticWeekModel?
}

/// 统计实体-天
class KSHomeStatisticDayModel: KSBaseModel {
    var SignIn: Int?
    var Order: Int?
}

/// 统计实体-周
class KSHomeStatisticWeekModel: KSBaseModel {
    var Total: Int?
    var SignIn: Int?
    var Back: Int?
}
