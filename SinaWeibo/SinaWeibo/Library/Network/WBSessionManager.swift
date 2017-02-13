//
//  WBSessionManager.swift
//  SinaWeibo
//
//  Created by ljcoder on 17/2/13.
//  Copyright © 2017年 ljcoder. All rights reserved.
//

import UIKit
import AFNetworking

enum WBHttpMethod {
    case GET
    case POST
}

class WBSessionManager: AFHTTPSessionManager {

    static let shared = WBSessionManager()
    
    func request(method: WBHttpMethod = .GET, URLString: String, parameters: [String: AnyObject], complation:@escaping (_ json: Any?, _ isSuccess: Bool)->()) {
        
        let success = { (dataTask: URLSessionDataTask, json: Any?)->() in
            complation(json, true)
        }
        
        let failure = { (dataTask: URLSessionDataTask?, error: Error)->() in
            complation(nil, false)
        }
        
        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
        else {
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
        
        
    }
    
}
