//
//  KSBaseService.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/3.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

typealias successBlock = (_ request:Request?, _ responseData:Any) -> Void
typealias failureBlock = (_ request:Request?, _ error:Error) -> Void

protocol KSServiceProtocol {
    //var reqTask:Request? { get set }
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
                                            printLog("errorRequest == \(error)")
                                            failure(request, error)
                                        }
        }
        return request;
    }


}

class KSBaseService: NSObject,KSServiceProtocol {
    
    var request:Request?
    
    
    
    
    
    
}
