//
//  Helper.swift
//  iTrains
//
//  Created by veerareddy on 12/27/17.
//  Copyright © 2017 veerareddy. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Helper{
    
    class func trainConnectionForDictionary(departureDate:String,dict: NSDictionary) -> TrainConnection? {
        
        let predicate = NSPredicate(format: "departureDate = %@", [departureDate])
        let newObject = coreDataObjectForPredicate(predicate:predicate,entityName: "TrainConnection") as! TrainConnection
        
        newObject.trainConnectionData = NSKeyedArchiver.archivedData(withRootObject: dict) as NSData
        newObject.departureDate = departureDate
        
        return newObject
        
    }
    
    class func coreDataObjectForPredicate(predicate:NSPredicate,entityName: String) -> AnyObject {
        
        let fetchRequest = NSFetchRequest<TrainConnection>(entityName: entityName)
        fetchRequest.predicate = predicate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var result: [TrainConnection]?
        
        do {
            result = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        //return if alreay created or create a new one
        guard let unwrappedResult = result?.first else{
            print("unwrappedResult is empty")
            return NSEntityDescription.insertNewObject(forEntityName: entityName, into: appDelegate.persistentContainer.viewContext)
            
        }
        
        return unwrappedResult
        
    }
    
    class func dictionaryFromData(binaryData : NSData?) -> NSDictionary {
        
        guard let unwrappedData = binaryData else{
            print("binaryData is NILL")
            return NSDictionary()
        }
        
        return NSKeyedUnarchiver.unarchiveObject(with: unwrappedData as Data) as! NSDictionary
    }
    
    class func fetchAllConnections() -> [TrainConnection]{
        
        let fetchRequest = NSFetchRequest<TrainConnection>(entityName: "TrainConnection")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        var result: [TrainConnection]?
        do {
            result = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        guard let unwrappedResult = result else{
            print("unwrappedResult is empty")
            return []
        }
        
        return unwrappedResult
    }
    
    class func parseConnectionFromJson(json:[String:Any]) -> Connection{
        
        let connection = Connection()
        connection.setValuesForKeys(json)
        return connection
    }
    
}
