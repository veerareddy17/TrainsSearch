//
//  FavouriteViewController.swift
//  iTrains
//
//  Created by veerareddy on 12/27/17.
//  Copyright © 2017 veerareddy. All rights reserved.
//

import UIKit

class FavouriteViewController: UITableViewController {
    
    var connectionList:[Connection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.connectionList.removeAll()
        let connectionList = Helper.fetchAllConnections()
        
        for connection in connectionList{
            let obj = Helper.dictionaryFromData(binaryData: connection.trainConnectionData)
            
            if let json = obj as? [String : Any]{
                let connection = Helper.parseConnectionFromJson(json: json)
                self.connectionList.append(connection)
                
            }
            
        }
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return connectionList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionCell", for: indexPath) as! ConnectionCell
        
        cell.configure(connection:self.connectionList[indexPath.row])
        return cell
    }
}
