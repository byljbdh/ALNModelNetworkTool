//
//  ViewController.swift
//  ALNNetworkToolDemo
//
//  Created by Avatar on 16/6/13.
//  Copyright © 2016年 ALN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkOil(sender: AnyObject) {
        let checkOilRequest = CheckOilPriceRequest(key: "ec44c817c831b08c33e6d0c8de7af123")
        
        checkOilRequest .sendRequest { (objc, error, badNetwork) in
            print(objc)
        }
    }

}

