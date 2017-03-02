//
//  TRCreatePostViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 3/1/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit

class TRCreatePostViewController: APIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func postButtonTapped(_ sender: AnyObject) {
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.text = ""
    }
}
