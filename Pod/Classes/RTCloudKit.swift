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
    public typealias RTRecordIdResultBlock = (recordId: CKRecordID, error: NSError?) -> Void
    public typealias RTArrayResultBlock = (objects: [CKRecord]?, error: NSError?) -> Void
    public typealias RTObjectResultBlock = (object: CKRecord?, error: NSError?) -> Void

    public static let sharedInstance = RTCloudKit()
    
    var defaultContainer: CKContainer!
    var publicDB: CKDatabase!
    var privateDB: CKDatabase!
    
    override init () {
        defaultContainer = CKContainer.defaultContainer()
        publicDB = defaultContainer.publicCloudDatabase
        privateDB = defaultContainer.privateCloudDatabase
        defaultContainer.accountStatusWithCompletionHandler { (status: CKAccountStatus, error: NSError?) -> Void in
            if (status == .NoAccount) {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                })
            } else {
                // Insert your just-in-time schema code here
            }
        }
    }
    
    public func fetchRecordRecordWithID(recordID: CKRecordID, completionHandler: RTObjectResultBlock) {
        publicDB.fetchRecordWithID(recordID) { (record: CKRecord?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completionHandler(object: record, error: error)
            })
        }
    }
    
    public func saveRecordInBackground(record: CKRecord, completionHandler: RTObjectResultBlock) {
        publicDB.saveRecord(record) { (record: CKRecord?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completionHandler(object: record, error: error)
            })
        }
    }
    
    public func deleteRecordInBackground(recordId: CKRecordID, completionHandler: RTRecordIdResultBlock) {
        publicDB.deleteRecordWithID(recordId) { (recordID: CKRecordID?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completionHandler(recordId: recordId, error: error)
            })
        }
    }
    
    public func performQuery(query: CKQuery, inZoneWithID zoneId: CKRecordZoneID? = nil, completionHandler: RTArrayResultBlock) {
        publicDB.performQuery(query, inZoneWithID: zoneId) { (objects: [CKRecord]?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completionHandler(objects: objects, error: error)
            })
        }
    }
}
