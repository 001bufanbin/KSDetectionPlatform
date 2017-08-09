//
//  KSService.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/9.
//  Copyright © 2017年 kris. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

protocol KSServiceProtocol {
    //var requestTask:Request { get set }
}

//extension KSServiceProtocol {
//    func getRequest(url: String,
//                    parameters:Dictionary<String, Any>? = nil,
//                    success:@escaping (_ request:Request, _ responseData:Any) -> (),
//                    failure:@escaping (_ request:Request) -> ()) {
//        let requestTask = Alamofire.request(url,
//                                            method: .get,
//                                            parameters: parameters,
//                                            encoding: URLEncoding.default,
//                                            headers: nil).responseJSON { (response) in
//                                                switch response.result {
//                                                case .success:
//                                                    if let value = response.result.value {
//                                                        let json = JSON(value)
//                                                        printLog("responseJSON == \(json)")
//                                                        success(requestTask, json)
//                                                    }
//                                                case .failure(let error):
//                                                    printLog("errorRequest == \(error)")
//                                                    failure(requestTask)
//                                                }
//        }
//    }
//}
