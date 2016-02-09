//
//  RTCloudKit.swift
//  Pods
//
//  Created by Tayal, Rishabh on 2/9/16.
//
//

import CloudKit

public class RTCloudKit: NSObject {
    
    //Completion Blocks
    public typealias RTBooleanResultBlock = (succeeded: Bool, error: NSError?) -> Void
    public typealias RTArrayResultBlock = (objects: [CKRecord]?, error: NSError?) -> Void
    public typealias RTObjectResultBlock = (object: CKRecord?, error: NSError?) -> Void

    public static let sharedInstance = RTCloudKit()
    
    public let defaultContainer = CKContainer.defaultContainer()
    public let publicDB = CKContainer.defaultContainer().publicCloudDatabase
    public let privateDB = CKContainer.defaultContainer().privateCloudDatabase
    
    public func fetchRecordRecordWithID(recordID: CKRecordID, completionHandler: RTObjectResultBlock) {
        publicDB.fetchRecordWithID(recordID) { (record: CKRecord?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completionHandler(object: record, error: error)
            })
        }
    }
}
