//
//  KSHomeViewModel.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/29.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

class KSHomeViewModel: KSBaseViewModel {

    // MARK: - 首页相关请求单例
    static let share = KSHomeViewModel ()
    private override init() {
        super.init()
    }



    /// 获取首页信息
    ///
    /// - Parameters:
    ///   - success: 成功回调
    ///   - failure: 失败回调
    func loadHomeInfo(success:@escaping successModelBlock<KSHomeService.ResponseModel>,
                      failure:@escaping failureModelBlock) -> Void {
        self.loadRequest(service: KSHomeService(), success: { (request, json) in
            if let dic:NSDictionary = json as? NSDictionary,
                let homeModel = KSHomeModel.deserialize(from: dic) {
                success(request, homeModel)
            }
        }, failure: { (request, error) in
            failure(request, error)
        })
    }


    /// 获取首页图片拍摄样例
    ///
    /// - Parameters:
    ///   - success: 成功回调
    ///   - failure: 失败回调
    func loadHomePicSample(success:@escaping successModelBlock<KSHomePicSampleService.ResponseModel>,
                           failure:@escaping failureModelBlock) -> Void {

        /// 处理订单类型-orderType
        var orderType: JZGOrderType
        let userTypeOp = Int((KSGlobal.share.userModel?.UserTypeOp)!)
        if userTypeOp == 0 || userTypeOp == 1 || userTypeOp == 5 || userTypeOp == 6 {//18张
            orderType = .JZGOrderTypeOnLineEighteen
        } else if userTypeOp == 3 || userTypeOp == 4 {//6张
            orderType = .JZGOrderTypeOnLineSix
        } else if userTypeOp == 7 || userTypeOp == 8 {//9张
            orderType = .JZGOrderTypeOnLineNine
        } else if userTypeOp == 2 {//线下
            orderType = .JZGOrderTypeOffLine
            return
        } else {
            orderType = .JZGOrderTypeOnLineEighteen
            return
        }

        var type: String = ""
        if orderType == .JZGOrderTypeOnLineSix {
            type = "six"
        } else if orderType == .JZGOrderTypeOnLineNine {
            type = "nine"
        } else if orderType == .JZGOrderTypeOnLineEighteen {
            let isNewEighteen = Int((KSGlobal.share.userModel?.isNewEighteen)!)
            if isNewEighteen == 1 {
                type = "neweighteen"
            } else {
                type = "eighteen"
            }
        }



        self.loadRequest(service: KSHomePicSampleService(type: type), success: { (request, json) in
            if let dic:NSDictionary = json as? NSDictionary,
                let homePicModel = KSHomePicSampleListModel.deserialize(from: dic) {
                success(request, homePicModel)
            }
        }, failure: { (request, error) in
            failure(request, error)
        })
    }


    
}
