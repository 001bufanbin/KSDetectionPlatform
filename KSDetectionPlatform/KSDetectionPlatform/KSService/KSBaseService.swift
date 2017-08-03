//
//  KSBaseService.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/3.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit
import Alamofire

class KSBaseService: NSObject {

    typealias requestSuccessBlock = (dataTask:URLSessionDataTask, response:Any)
    
    /// GET 请求
    ///
    /// - Parameters:
    ///   - url: 请求地址
    ///   - parameters: 请求字典
    /// - Returns: 请求Task
    @discardableResult
    func getRequest(url: String, parameters:Dictionary<String, Any>? = nil) -> URLSessionDataTask {
        let dataTask:Request = Alamofire.request(url,
                                                 method: .get,
                                                 parameters: parameters,
                                                 encoding: URLEncoding.default,
                                                 headers: nil).responseString
            {
                (response) in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    print("responseJSON: \(response)")
                    print("responseJSON: \(response.result)")
                case .failure(let error):
                    print(error)
                }
        }
        return dataTask.task as! URLSessionDataTask
    }
    
    
    /// POST 请求
    ///
    /// - Parameters:
    ///   - url: 请求地址
    ///   - parameters: 请求字典
    /// - Returns: 请求Task
    @discardableResult
    func postRequest(url: String, parameters:Dictionary<String, Any>) -> URLSessionDataTask {
        let dataTask:Request = Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
        }
        return dataTask.task as! URLSessionDataTask
    }
    
}
