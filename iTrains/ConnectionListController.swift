//
//  ConnectionListController.swift
//  iTrains
//
//  Created by veerareddy on 12/27/17.
//  Copyright © 2017 veerareddy. All rights reserved.
//

import UIKit

class ConnectionListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let manager = ApiManager()
    var fromPlace:String!
    var toPlace:String!
    var connectionList:[Connection] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        manager.getConnections(fromValue: fromPlace, toValue: toPlace) { (connectionList) in
            
            self.connectionList = connectionList
            
            if self.connectionList.count > 0{
             self.tableView.reloadData()
            }else{
                let alertController = UIAlertController(title: "Error", message: "Please enter a valid locations", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                    print("Ok action pressed")
                })
                
                alertController.addAction(action)
                self.navigationController?.present(alertController, animated: true, completion: nil)
            }
            
            
        }
    }

}
extension ConnectionListController:UITableViewDelegate,UITableViewDataSource,ConnectionCellDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return connectionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionCell", for: indexPath) as! ConnectionCell
        cell.delegate = self
        cell.currentIndexPath = indexPath
        cell.configure(connection:self.connectionList[indexPath.row])
        return cell
    }
    
    func favouriteButtonPressed(indexPath:IndexPath){
        
        let connection = self.connectionList[indexPath.row]
        if let departure = connection.departure{
            
         _ = Helper.trainConnectionForDictionary(departureDate: departure, dict: connection.jsonData as NSDictionary)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.saveContext()
        }else{
            
            let alertController = UIAlertController(title: "Error", message: "Cannot add to favourite right now", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                print("Ok action pressed")
            })
            
            alertController.addAction(action)
            self.navigationController?.present(alertController, animated: true, completion: nil)
        }
        
    }

}
