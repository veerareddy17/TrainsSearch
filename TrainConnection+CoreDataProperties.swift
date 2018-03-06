//
//  TrainConnection+CoreDataProperties.swift
//  iTrains
//
//  Created by Pavan Gopal on 12/27/17.
//  Copyright © 2017 veerareddy. All rights reserved.
//
//

import Foundation
import CoreData


extension TrainConnection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrainConnection> {
        return NSFetchRequest<TrainConnection>(entityName: "TrainConnection")
    }

    @NSManaged public var trainConnectionData: NSData?
    @NSManaged public var departureDate: String?

}
