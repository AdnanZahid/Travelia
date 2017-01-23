//
//  TRLoginViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/16/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit
import BEMCheckBox

class TRLoginViewController: UIViewController {
    
    let personIconImageView = UIImageView(frame: CGRect(x: textFieldIconX, y: textFieldIconY, width: textFieldIconWidth, height: textFieldIconHeight))
    
    let passwordIconImageView = UIImageView(frame: CGRect(x: textFieldIconX, y: textFieldIconY, width: textFieldIconWidth, height: textFieldIconHeight))
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var rememberMeCheckbox: BEMCheckBox!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var roundedRectangleViewsArray: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRoundedRectangleViews()
        
        addIconsToTextFields()
        
        changeCheckBoxAppearance()
    }
    
    func changeCheckBoxAppearance() {
        
        rememberMeCheckbox.onTintColor = UIColor.white
        rememberMeCheckbox.onCheckColor = UIColor.white
    }
    
    func makeRoundedRectangleViews() {
        
        roundedRectangleViewsArray = [usernameTextField, passwordTextField, loginButton]
        
        for view in roundedRectangleViewsArray {
            
            view.layer.cornerRadius = roundedViewsCornerRadius
            view.layer.masksToBounds = true
        }
    }
    
    func addIconsToTextFields() {
        
        personIconImageView.image = personIconImage
        passwordIconImageView.image = passwordIconImage
        
        usernameTextField.leftViewMode = UITextFieldViewMode.always
        passwordTextField.leftViewMode = UITextFieldViewMode.always
        
        usernameTextField.leftView = personIconImageView
        passwordTextField.leftView = passwordIconImageView
    }
    
    @IBAction func rememberMeTapped(_ sender: AnyObject) {
        
        rememberMeCheckbox.setOn(!rememberMeCheckbox.on, animated: true)
    }
    
    @IBAction func forgotPasswordTapped(_ sender: AnyObject) {
        
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: AnyObject) {
        
        performSegue(withIdentifier: kLoginToSignUpSegue, sender: self)
    }
    
    @IBAction func loginTapped(_ sender: AnyObject) {
        
    }
}

