//
//  LoaderViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 2/17/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit

class LoaderViewController: APIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callAPI()
    }
    
    override func makeRequest() {
        
        view.isHidden = true
    }
    
    override func success() {
        
        view.isHidden = false
    }
    
    override func failure() {
        
    }
}
