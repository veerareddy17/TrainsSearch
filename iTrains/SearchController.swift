//
//  SearchController.swift
//  iTrains
//
//  Created by veerareddy on 12/27/17.
//  Copyright © 2017 veerareddy. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func getConnnectionButtonPressed(_ sender: UIButton) {
        
        if ((fromTextField.text ?? "").count) == 0 || (toTextField.text ?? "").count ==  0{
            
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid locations", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                print("Ok action pressed")
            })
            
            alertController.addAction(action)
            self.navigationController?.present(alertController, animated: true, completion: nil)
            return 
        }
        
        if let fromLocationD = fromTextField.text, let toLocationD = toTextField.text{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "ConnectionListController") as! ConnectionListController
            controller.fromPlace = fromLocationD
            controller.toPlace = toLocationD
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
