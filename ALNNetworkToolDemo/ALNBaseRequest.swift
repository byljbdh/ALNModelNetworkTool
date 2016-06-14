//
//  ALNBaseRequest.swift
//  swiftDNS
//
//  Created by Avatar on 16/6/4.
//  Copyright © 2016年 ALN. All rights reserved.
//

import Foundation

class ALNBaseRequest: NSObject {
   
    var parameters = [String: AnyObject]()
    
    func sendRequest(finished: Finished){
        ALNNetworkTool.shareNetworkTool().sendDefaultURLRequestWithParameter(parameters, finished: finished)
    }
}
