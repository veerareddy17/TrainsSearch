//
//  SafeJsonObject.swift
//  iTrains
//
//  Created by veerareddy on 12/27/17.
//  Copyright © 2017 veerareddy. All rights reserved.
//

import Foundation

open class SafeJsonObject: NSObject {
    
    override open func setValue(_ value: Any?, forKey key: String) {
        
        let selectorString = "set\(key.uppercased().first!)\(String(key.dropFirst())):"
        let selector = Selector(selectorString)
        
        if responds(to: selector) {
            super.setValue(value, forKey: key)
        }
    }
    
}
