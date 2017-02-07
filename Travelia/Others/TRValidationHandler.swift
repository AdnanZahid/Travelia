//
//  TRValidationHandler.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/25/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import Foundation

class TRValidationHandler {
    
    static let sharedInstance: TRValidationHandler = TRValidationHandler()
    
    func areUsernameAndPasswordFilled(userName: String, password: String) -> Bool {
        
        var success = true
        
        if userName.isBlank == true {
            
            AlertView.sharedInstance.items.append(blankUsernameMessage)
            
            success = false
        }
        
        if password.isBlank == true {
            
            AlertView.sharedInstance.items.append(blankPasswordMessage)
            
            success = false
        }
        
        return success
    }
    
    func areUsernameAndEmailAndPasswordFilled(userName: String, userEmail: String, password: String) -> Bool {
        
        var success = true
        
        if userName.isBlank == true {
            
            AlertView.sharedInstance.items.append(blankUsernameMessage)
            
            success = false
        }
        
        if userEmail.isBlank == true {
            
            AlertView.sharedInstance.items.append(blankEmailMessage)
            
            success = false
        }
        
        if password.isBlank == true {
            
            AlertView.sharedInstance.items.append(blankPasswordMessage)
            
            success = false
        }
        
        return success
    }
    
    func isEmailValid(userEmail: String) -> Bool {
        
        var success = true
        
        if userEmail.isBlank == false && userEmail.isEmail == false {
            
            AlertView.sharedInstance.items.append(invalidEmailMessage)
            
            success = false
        }
        
        return success
    }
    
    func areBothPasswordsMatching(password: String, rePassword: String) -> Bool {
        
        var success = true
        
        if password.isBlank == false && password != rePassword {
            
            AlertView.sharedInstance.items.append(unmatchingPasswordsMessage)
            
            success = false
        }
        
        return success
    }
}
