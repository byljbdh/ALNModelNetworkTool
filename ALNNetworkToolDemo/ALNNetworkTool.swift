//
//  ALNNetworkTool.swift
//  swiftDNS
//
//  Created by Avatar on 16/6/1.
//  Copyright © 2016年 ALN. All rights reserved.
//

import Foundation
import Alamofire
typealias Finished = ((objc: [String : AnyObject]?, error: NSError?, badNetwork: Bool?) -> ())?
class ALNNetworkTool: Alamofire.Manager {
    private static let tool: ALNNetworkTool = {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = Manager.defaultHTTPHeaders
        return ALNNetworkTool(configuration: configuration)
    }()
    
    class func shareNetworkTool() -> ALNNetworkTool{
        return tool;
    }
    
    func sendDefaultURLRequestWithParameter(parameter: [String: AnyObject]? = nil, finished: Finished) {
        let defaultURL = "http://apis.juhe.cn/cnoil/oil_city"
        self.sendRequest(defaultURL, parameter: parameter, finished: finished)
    }
    
    //basic Sending Request
    func sendRequest(URLString: URLStringConvertible,parameter: [String: AnyObject]?, finished: Finished) {
        request(.POST, URLString, parameters: parameter, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) in
            if response.result.isSuccess{
                if let dict = response.result.value as? [String: AnyObject]{
                    finished!(objc: dict, error: nil, badNetwork: false)
                }else{//没有数据.网络错误
                    finished!(objc: nil, error: response.result.error, badNetwork: true)
                }
            }else{//网络错误
                finished!(objc: nil, error: response.result.error, badNetwork: true)
            }
        }
    }
}
