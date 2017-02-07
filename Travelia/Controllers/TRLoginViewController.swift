//
//  TRLoginViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/16/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit
import BEMCheckBox

import Firebase
import FBSDKLoginKit
import TwitterKit
import GoogleSignIn

class TRLoginViewController: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {
    
    let personIconImageView = UIImageView(frame: CGRect(x: textFieldIconX, y: textFieldIconY, width: textFieldIconWidth, height: textFieldIconHeight))
    
    let passwordIconImageView = UIImageView(frame: CGRect(x: textFieldIconX, y: textFieldIconY, width: textFieldIconWidth, height: textFieldIconHeight))
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var rememberMeCheckbox: BEMCheckBox!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    
    @IBOutlet weak var twitterLoginButton: TWTRLogInButton!
    
    var roundedRectangleViewsArray: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRoundedRectangleViews()
        
        addIconsToTextFields()
        
        changeCheckBoxAppearance()
        
        setupFacebookLoginButton()
        
        setupTwitterLoginButton()
        
        setupGoogleLoginButton()
    }
    
    func setupFacebookLoginButton() {
        
        facebookLoginButton.delegate = self
    }
    
    func setupTwitterLoginButton() {
        
        twitterLoginButton = TWTRLogInButton(logInCompletion: { session, error in
            
            if let newSession = session {
                
                let authToken = newSession.authToken
                let authTokenSecret = newSession.authTokenSecret
                // ...
                
                let credential = FIRTwitterAuthProvider.credential(withToken: newSession.authToken, secret: newSession.authTokenSecret)
                
                FIRAuth.auth()?.signIn(with: credential) { (user, error) in
                    // ...
                    if let error = error {
                        // ...
                        return
                    }
                }
                
            } else {
                // ...
            }
        })
    }
    
    func setupGoogleLoginButton() {
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        if let accessToken = FBSDKAccessToken.current() {
        
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            FIRAuth.auth()?.signIn(with: credential) { (user, error) in
                // ...
                if let _ = error {
                    // ...
                    return
                }
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
        
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
        
        let userName = usernameTextField.text!
        let password = passwordTextField.text!
        
        let success = TRValidationHandler.sharedInstance.areUsernameAndPasswordFilled(userName: userName, password: password)
        
        if success == true {
            
            TRUserService.sharedInstance.loginAPI(userName: userName, password: password, success: {
                
                self.present(AlertView.sharedInstance.alertViewWith(title: loggedInSuccessTitle, message: loggedInSuccessMessage, buttonTitle: loggedInSuccessButton, handler: {
                    
                    
                }), animated: true, completion: nil)
                
                }, failure: {
                    
                    self.present(AlertView.sharedInstance.alertViewWith(title: loggedInFailureTitle, message: loggedInFailureMessage, buttonTitle: loggedInFailureButton, handler: {
                        
                        
                    }), animated: true, completion: nil)
            })
            
        } else {
            
            present(AlertView.sharedInstance.alertViewWithMultipleIncorrectItems(title: incorrectItemsMessage, buttonTitle: incorrectItemsButton, handler: {
                
                
            }), animated: true, completion: nil)
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
        
        loginAPICall()
    }
    
    @IBAction func googleLoginButtonTapped(_ sender: AnyObject) {
        
        GIDSignIn.sharedInstance().signIn()
    }
}

