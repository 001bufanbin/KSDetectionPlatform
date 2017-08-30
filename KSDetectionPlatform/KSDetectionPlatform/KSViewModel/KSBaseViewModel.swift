//
//  KSBaseViewModel.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/14.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

import Alamofire
//此处只为打印
import SwiftyJSON

/// 请求回调-参数为json（Any）
typealias successBlock = (_ request:Request?, _ responseData:Any?) -> Void
typealias failureBlock = (_ request:Request?, _ error:Error) -> Void

///请求回调-参数为model(子类使用，子类对应的model实体)
typealias successModelBlock<T> = (_ request:Request?, _ responseData:T) -> Void
typealias failureModelBlock = (_ request:Request?, _ error:Error) -> Void

class KSBaseViewModel: NSObject, KSServiceProtocol {

    var request:Request?
    var allRequest = Array<Request> ()

    /// 请求
    ///
    /// - Parameters:
    ///   - service: 请求SERVICE
    ///   - success: 请求成功回调
    ///   - failure: 请求失败回调
    func loadRequest<T: KSBaseService>(service: T,
                     success:@escaping successBlock,
                     failure:@escaping failureBlock) {
        //处理请求字典
        let parameters = KSServiceTool.sortDic(dicSort: service.parameter)

        switch service.method {
        case .get:
            request = self.getRequest(url: service.url, parameters: parameters, success: { (request, json) in
                let dicJson = KSBaseViewModel.dealResponseToDic(json: json)
                success(request, dicJson)
            }, failure: { (request, error) in
                failure(request, error)
            })
        case .post:
            request = self.postRequest(url: service.url, parameters: parameters, success: { (request, json) in
                let dicJson = KSBaseViewModel.dealResponseToDic(json: json)
                success(request, dicJson)
            }, failure: { (request, error) in
                failure(request, error)
            })
        default:
            request = self.postRequest(url: service.url, parameters: parameters, success: { (request, json) in
                let dicJson = KSBaseViewModel.dealResponseToDic(json: json)
                success(request, dicJson)
            }, failure: { (request, error) in
                failure(request, error)
            })
        }

    }


    /// 处理服务器返回json格式不标准的问题-json标准（“Data”:{},“status”:100,“msg”:"ok"）
    ///
    /// - Parameter json: 服务器返回的json
    /// - Returns: 标准json返回Data字段的值，非标准（没有Data字段）返回整个json
    static func dealResponseToDic(json: Any?) -> Any? {
        /// 1.json能转成Dictionary? 执行第2步:执行第3步；
        /// 2.json取Data字段能转成Dictionary? 执行第4步:执行第5步-（说明返回的data字段内的值为Array）
        /// 3.返回服务器返回的json
        /// 4.返回data字段的值，类型为Dictionary
        /// 5.返回data字段的值为value，“KSList”为key的Dictionary
        if let dicJson = json as? Dictionary<String, Any> {

            var dicData = dicJson["Data"]
            if dicData is Dictionary<String, Any> {
                return dicData
            } else if dicData is Array<Any> {
                dicData = ["KSList":dicData]
                return dicData
            } else {
                return dicJson
            }

        }
        return json
    }

}


protocol KSServiceProtocol {

}

extension KSServiceProtocol {
    /// GET 请求
    ///
    /// - Parameters:
    ///   - url: 请求URL
    ///   - parameters: 请求字典
    ///   - success: 成功回调
    ///   - failure: 失败回调
    func getRequest(url: String,
                    parameters:Dictionary<String, Any>? = nil,
                    success:@escaping successBlock,
                    failure:@escaping failureBlock) -> Request? {

        var request:Request?
        request = Alamofire.request(url,
                                    method: .get,
                                    parameters: parameters,
                                    encoding: URLEncoding.default,
                                    headers: nil).responseJSON { (response) in
                                        switch response.result {
                                        case .success:
                                            if let value = response.result.value {
                                                let json = JSON(value)
                                                printLog("request == \(String(describing: request?.request)))")
                                                printLog("responseJSON == \(json)")
                                                success(request, value)

                                            }
                                        case .failure(let error):
                                            let errorCode = (error as NSError).code
                                            //request cancel not called FailureBlock
                                            if errorCode != NSURLErrorCancelled {
                                                printLog("errorRequest == \(error)")
                                                failure(request, error)
                                            }
                                        }
        }
        return request;
    }

    /// POST 请求
    ///
    /// - Parameters:
    ///   - url: 请求URL
    ///   - parameters: 请求字典
    ///   - success: 成功回调
    ///   - failure: 失败回调
    func postRequest(url: String,
                     parameters:Dictionary<String, Any>? = nil,
                     success:@escaping successBlock,
                     failure:@escaping failureBlock) -> Request? {
        var request:Request?
        request = Alamofire.request(url,
                                    method: .post,
                                    parameters: parameters,
                                    encoding: URLEncoding.default,
                                    headers: nil).responseJSON { (response) in
                                        switch response.result {
                                        case .success:
                                            if let value = response.result.value {
                                                let json = JSON(value)
                                                printLog("request == \(String(describing: request?.request)))")
                                                printLog("parameters == \(String(describing: parameters))")
                                                printLog("responseJSON == \(json)")
                                                success(request, value)
                                            }
                                        case .failure(let error):
                                            let errorCode = (error as NSError).code
                                            //request cancel not called FailureBlock
                                            if errorCode != NSURLErrorCancelled {
                                                printLog("errorRequest == \(error)")
                                                failure(request, error)
                                            }
                                        }
        }
        return request;
    }
    
    
}
