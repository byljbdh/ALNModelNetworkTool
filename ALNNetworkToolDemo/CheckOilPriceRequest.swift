//
//  CheckOilPriceRequest.swift
//  ALNModelNetworkToolDemo
//
//  Created by Avatar on 16/6/13.
//  Copyright © 2016年 ALN. All rights reserved.
//

import UIKit

class CheckOilPriceRequest: ALNBaseRequest {
    init(key: String){
        super.init()
        parameters["key"] = key
    }
}
