//
//  TRHomeViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 2/7/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit

class TRHomeViewController: APIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSegue(withIdentifier: kHomeToProfileSegue, sender: self)
    }
}
