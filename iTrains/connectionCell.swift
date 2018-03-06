//
//  connectionCell.swift
//  iTrains
//
//  Created by veerareddy on 12/27/17.
//  Copyright © 2017 veerareddy. All rights reserved.
//

import UIKit
protocol ConnectionCellDelegate:class {
    func favouriteButtonPressed(indexPath:IndexPath)
}

class ConnectionCell: UITableViewCell {
    @IBOutlet weak var fromValue: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var platform: UILabel!
    
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    var currentIndexPath:IndexPath!
    weak var delegate: ConnectionCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(connection:Connection){
        
        fromValue.text = "From: \((connection.from?.name ?? ""))"
        toLabel.text = "To: \(connection.to?.name ?? "")"
        platform.text = "Platform: \((connection.platform ?? ""))"
        duration.text = "Duration: \((connection.duration ?? ""))"
    }
    
    @IBAction func favouriteButtonPressed(_ sender: UIButton) {
        delegate?.favouriteButtonPressed(indexPath: self.currentIndexPath)
    }
}
