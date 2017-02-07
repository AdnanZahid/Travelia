//
//  AlertView.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/25/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import Foundation

class AlertView {
    
    static let sharedInstance: AlertView = AlertView()

    var items: [String] = []
    
    func alertViewWith(title: String, message: String, buttonTitle: String, handler: () -> ()) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.default, handler: nil))
        
        return alert
    }
    
    func alertViewWithMultipleIncorrectItems(title: String, buttonTitle: String, handler: () -> ()) -> UIAlertController {
        
        var message = ""
        
        for i in 1 ... items.count {
            
            message.append("\n\(i). \(items[i - 1])")
        }
        
        items = []
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.default, handler: nil))
        
        return alert
    }
}
