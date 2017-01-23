//
//  TRLoginViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/16/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit
import BEMCheckBox
import Alamofire
import SwiftyJSON

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
        
        loginAPICall()
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
    
    func loginAPICall() {
        
        Alamofire.request("http://sample-env.dvprfpyk3f.us-west-2.elasticbeanstalk.com/android/v1/signin/login?userName=Adnan&userPass=Zahid").responseJSON { (responseData) -> Void in
            
            if((responseData.result.value) != nil) {
                let json = JSON(responseData.result.value!)
                
                let rows = json["rows"]
                
                let firstRow = rows[0]
                
                if let id = firstRow["id"].string,
                    let userName = firstRow["userName"].string,
                    let userEmail = firstRow["userEmail"].string {
                    
                    
                    
                }
            }
        }
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

