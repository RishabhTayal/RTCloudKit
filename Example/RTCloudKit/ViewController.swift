//
//  ViewController.swift
//  RTCloudKit
//
//  Created by Rishabh Tayal on 02/09/2016.
//  Copyright (c) 2016 Rishabh Tayal. All rights reserved.
//

import UIKit
import RTCloudKit
import CloudKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recordId = CKRecordID(recordName: "name")
        RTCloudKit.sharedInstance.fetchRecordRecordWithID(recordId) { (object, error) -> Void in
            print(object)
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

