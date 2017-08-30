//
//  KSSettingViewModel.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/30.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSSettingViewModel: KSBaseViewModel {

    // MARK: - 设置相关请求单例
    static let share = KSSettingViewModel ()
    private override init() {
        super.init()
    }


    /// 获取消息数量
    ///
    /// - Parameters:
    ///   - success: 成功回调
    ///   - failure: 失败回调
    func loadMsgCount(success:@escaping successModelBlock<KSSettingMsgCountService.ResponseModel>,
                      failure:@escaping failureModelBlock) -> Void {
        self.loadRequest(service: KSSettingMsgCountService(), success: { (request, json) in
            if let dic:NSDictionary = json as? NSDictionary,
                let msgCountModel = KSSettingMsgCountModel.deserialize(from: dic) {
                success(request, msgCountModel)
            }
        }, failure: { (request, error) in
            failure(request, error)
        })
    }
    

}
