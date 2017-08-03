//
//  KSServiceManager.swift
//  KSDetectionPlatform
//
//  Created by bufb on 2017/8/2.
//  Copyright © 2017年 kris. All rights reserved.
//

import UIKit
import Alamofire


class KSServiceManager: NSObject {
    
    func request() -> Void {
        
//        Alamofire.request("https://httpbin.org/get").response { (response) in
//            print("response: \(String(describing: response.response))")
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)")
//            }
//        }
        
//        Alamofire.request("https://httpbin.org/get").responseData { (response) in
//            print("responseData: \(response)")
//            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)")
//            }
//        }
        
//        Alamofire.request("https://httpbin.org/get").responseString { (response) in
//            print("responseString: \(String(describing: response.result.value)))")
//        }
//
        Alamofire.request("https://httpbin.org/get").responseJSON { (response) in
            print("responseJSON: \(response)")
            print("responseJSON: \(response.result)")
        }
        
        
        
    }
    
}
