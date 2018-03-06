//
//  MasterController.swift
//  iTrains
//
//  Created by veerareddy on 12/27/17.
//  Copyright © 2017 veerareddy. All rights reserved.
//

import UIKit

class MasterController: UITableViewController {
    
    
    var favouriteViewController:UINavigationController!
    var searchController:UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.row == 0{
            cell.textLabel?.text = "Search connections"
        }else{
            cell.textLabel?.text = "View favourited connections"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if let searchControllerD = searchController{
                splitViewController?.showDetailViewController(searchControllerD, sender: nil)
            }else{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "SearchController") as! UINavigationController
                searchController = controller
                splitViewController?.showDetailViewController(controller, sender: nil)
                
            }
            
        }else{
            if let favouriteViewControllerD = favouriteViewController{
                splitViewController?.showDetailViewController(favouriteViewControllerD, sender: nil)
            }else{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "FavouriteViewController") as! UINavigationController
                favouriteViewController = controller
                splitViewController?.showDetailViewController(controller, sender: nil)
            }
            
            
        }
        
    }
    
}
