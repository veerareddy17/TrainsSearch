//
//  Connection.swift
//  iTrains
//
//  Created by veerareddy on 12/27/17.
//  Copyright © 2017 veerareddy. All rights reserved.
//

import Foundation

class Connection:SafeJsonObject{
    
    var from:Station?
    var to:Station?
    var platform:String?
    var duration:String?
    
    var departure: String?
    
    var jsonData:[String:Any] = [:]
    
    
    override public func setValue(_ value: Any?, forKey key: String) {
        
        if key == "from" {
            if let valueD = value as? [String:Any]{
                if let stationDict = valueD["station"] as? [String:Any]{
                let fromStation = Station()
                fromStation.setValuesForKeys(stationDict)
                self.from = fromStation
                }
                if let platform = valueD["platform"] as? String{
                    self.platform = platform
                }
                
                if let departure = valueD["departure"] as? String{
                    self.departure = departure
                }
               
            }
        }else if key == "to"{
            if let valueD = value as? [String:Any]{
                if let stationDict = valueD["station"] as? [String:Any]{
                let toStation = Station()
                toStation.setValuesForKeys(stationDict)
                self.to = toStation
                    
                }
           
            }
           
        }else if key == "duration"{
            if let duration = value as? String{
                self.duration = duration
            }
        }
        else {
            super.setValue(value, forKey: key)
        }
    }
}

class Station:SafeJsonObject{
    var id:String?
    var name: String?

    
    override public func setValue(_ value: Any?, forKey key: String) {
     
        if key == "name"{
            if let valued = value as? String{
                self.name = valued
            }
        }else if key == "id"{
            if let valueD = value as? String{
                self.id = valueD
            }
        }
    }
}

