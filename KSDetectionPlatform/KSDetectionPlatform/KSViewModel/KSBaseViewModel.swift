//
//  KSBaseViewModel.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/14.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

typealias successBlock = (_ request:Request?, _ responseData:Any) -> Void
typealias failureBlock = (_ request:Request?, _ error:Error) -> Void

class KSBaseViewModel: NSObject, KSServiceProtocol {

    var request:Request?
    var allRequest = Array<Request> ()

    /// 请求
    ///
    /// - Parameters:
    ///   - service: 请求SERVICE
    ///   - success: 请求成功回调
    ///   - failure: 请求失败回调
    func loadRequest(service: KSBaseService,
                     success:@escaping successBlock,
                     failure:@escaping failureBlock) {

        switch service.method {
        case .get:
            request = self.getRequest(url: service.url, parameters: service.parameter, success: { (request, json) in
                success(request, json)
            }, failure: { (request, error) in
                failure(request, error)
            })
        case .post:
            request = self.postRequest(url: service.url, parameters: service.parameter, success: { (request, json) in
                success(request, json)
            }, failure: { (request, error) in
                failure(request, error)
            })
        default:
            request = self.postRequest(url: service.url, parameters: service.parameter, success: { (request, json) in
                success(request, json)
            }, failure: { (request, error) in
                failure(request, error)
            })
        }

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
    @discardableResult
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
                                                printLog("responseJSON == \(json)")
                                                success(request, json)

                                            }
                                        case .failure(let error):
                                            printLog("errorRequest == \(error)")
                                            failure(request, error)
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
    @discardableResult
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
                                                printLog("responseJSON == \(json)")
                                                success(request, json)
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
