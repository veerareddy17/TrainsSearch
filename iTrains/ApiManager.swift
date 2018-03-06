//
//  ApiManager.swift
//  iTrains
//
//  Created by veerareddy on 12/27/17.
//  Copyright © 2017 veerareddy. All rights reserved.
//

import Foundation

class ApiManager{
    static let baseUrl = "http://transport.opendata.ch/v1/connections"
    
    func getConnections(fromValue:String,toValue:String,success:@escaping ([Connection])->()){
        
        let urlString = ApiManager.baseUrl + "?from=\(fromValue)&to=\(toValue)"
        
        guard let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return
        }
        
        if let url = URL(string:encodedUrlString){
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error)
                } else {
                    if let usableData = data {
                        do{
                            if let json = try! JSONSerialization.jsonObject(with: usableData, options: []) as? [String : Any]{
                                
                                if let connectionJsonArray = json["connections"] as? [[String:Any]]{
                                    var connectionArray: [Connection] = []
                                    
                                    for json in connectionJsonArray{
                                        let connection = Connection()
                                        connection.setValuesForKeys(json)
                                        connection.jsonData = json
                                        connectionArray.append(connection)
                                    }
                                    
                                    DispatchQueue.main.async {
                                        success(connectionArray)
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                }
            })
            
            task.resume()
        }
        
    }
}
