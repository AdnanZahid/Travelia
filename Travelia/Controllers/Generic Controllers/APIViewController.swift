//
//  APIViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 2/17/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit
import SwiftyJSON

class APIViewController: UIViewController, ServiceDelegate {
    
    var service: Service?
    
    func getService() -> Service {
        
        return Service()
    }
    
    func setupService() {
        
        service = getService()
        
        service?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupService()
    }
    
    func callAPI() {
        
    }
    
    func makeRequest() {
        
    }
    
    func success() {
        
    }
    
    func failure() {
        
    }
    
    func populateData(value: JSON) {
        
    }
}
