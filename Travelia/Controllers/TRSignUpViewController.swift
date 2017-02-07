//
//  TRSignUpViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/16/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit

class TRSignUpViewController: UIViewController {
    
    let personIconImageView = UIImageView(frame: CGRect(x: textFieldIconX, y: textFieldIconY, width: textFieldIconWidth, height: textFieldIconHeight))
    let emailIconImageView = UIImageView(frame: CGRect(x: textFieldIconX, y: textFieldIconY, width: textFieldIconWidth, height: textFieldIconHeight))
    let passwordIconImageView = UIImageView(frame: CGRect(x: textFieldIconX, y: textFieldIconY, width: textFieldIconWidth, height: textFieldIconHeight))
    let rePasswordIconImageView = UIImageView(frame: CGRect(x: textFieldIconX, y: textFieldIconY, width: textFieldIconWidth, height: textFieldIconHeight))
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var roundedRectangleViewsArray: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRoundedRectangleViews()
        
        addIconsToTextFields()
        //performSegue(withIdentifier: "kSignUpToLoginSegue", sender: nil)
    }
    
    func makeRoundedRectangleViews() {
        
        roundedRectangleViewsArray = [usernameTextField, emailAddressTextField, passwordTextField, rePasswordTextField, signUpButton]
        
        for view in roundedRectangleViewsArray {
            
            view.layer.cornerRadius = roundedViewsCornerRadius
            view.layer.masksToBounds = true
        }
    }
    
    func addIconsToTextFields() {
        
        personIconImageView.image = personIconImage
        emailIconImageView.image = emailIconImage
        passwordIconImageView.image = passwordIconImage
        rePasswordIconImageView.image = rePasswordIconImage
        
        usernameTextField.leftViewMode = UITextFieldViewMode.always
        emailAddressTextField.leftViewMode = UITextFieldViewMode.always
        passwordTextField.leftViewMode = UITextFieldViewMode.always
        rePasswordTextField.leftViewMode = UITextFieldViewMode.always
        
        usernameTextField.leftView = personIconImageView
        emailAddressTextField.leftView = emailIconImageView
        passwordTextField.leftView = passwordIconImageView
        rePasswordTextField.leftView = rePasswordIconImageView
    }
    
    func signUpAPICall() {
        
        let userName = usernameTextField.text!
        let userEmail = emailAddressTextField.text!
        let password = passwordTextField.text!
        let rePassword = rePasswordTextField.text!
        
        var success = TRValidationHandler.sharedInstance.areUsernameAndEmailAndPasswordFilled(userName: userName, userEmail: userEmail, password: password)
        
        success = TRValidationHandler.sharedInstance.isEmailValid(userEmail: userEmail) && success
        success = TRValidationHandler.sharedInstance.areBothPasswordsMatching(password: password, rePassword: rePassword) && success
        
        if success == true {
            
            TRUserService.sharedInstance.signUpAPI(userName: usernameTextField.text!, userEmail: emailAddressTextField.text!, password: passwordTextField.text!, success: {
                
                self.present(AlertView.sharedInstance.alertViewWith(title: signedUpSuccessTitle, message: signedUpSuccessMessage, buttonTitle: signedUpSuccessButton, handler: {
                    
                    
                }), animated: true, completion: nil)
                
                }, failure: {
                    
                    self.present(AlertView.sharedInstance.alertViewWith(title: signedUpFailureTitle, message: signedUpFailureMessage, buttonTitle: signedUpFailureButton, handler: {
                        
                        
                    }), animated: true, completion: nil)
            })
            
        } else {
            
            self.present(AlertView.sharedInstance.alertViewWithMultipleIncorrectItems(title: incorrectItemsMessage, buttonTitle: incorrectItemsButton, handler: {
                
                
            }), animated: true, completion: nil)
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: AnyObject) {
        
        signUpAPICall()
    }
}

