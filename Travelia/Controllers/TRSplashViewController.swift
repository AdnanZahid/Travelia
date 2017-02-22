//
//  TRSplashViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/16/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit

class TRSplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if TRUserData.getUser() == nil {
        
            performSegue(withIdentifier: kSplashToLoginSegue, sender: self)
            
        } else {
            
            performSegue(withIdentifier: kSplashToProfileSegue, sender: self)
        }
    }
}
