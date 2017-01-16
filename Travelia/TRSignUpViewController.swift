//
//  TRSignUpViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/16/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit

class TRSignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    var roundedRectangleViewsArray: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRoundedRectangleViews()
    }
    
    func makeRoundedRectangleViews() {
        
        roundedRectangleViewsArray = [usernameTextField, emailAddressTextField, passwordTextField, rePasswordTextField]
        
        for view in roundedRectangleViewsArray {
            
            view.layer.cornerRadius = 5
            view.layer.masksToBounds = true
        }
    }
}

