//
//  Service.swift
//  Travelia
//
//  Created by Adnan Zahid on 2/17/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import PKHUD
import SwiftyJSON

protocol ServiceDelegate {
    
    func makeRequest()
    
    func success()
    
    func failure()
    
    func populateData(value: JSON)
}

class Service {
    
    var delegate: ServiceDelegate?
    
    func makeRequest() {
        
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        
        delegate?.makeRequest()
    }
    
    func success() {
        
        PKHUD.sharedHUD.hide()
        
        delegate?.success()
    }
    
    func failure() {
        
        PKHUD.sharedHUD.hide()
        
        delegate?.failure()
    }
    
    func populateData(value: JSON) {
        
        delegate?.populateData(value: value)
    }
    
    func isError(value: JSON) -> Bool {
        
        return value["success"] == false
    }
}
