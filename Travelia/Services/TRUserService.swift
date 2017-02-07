//
//  TRUserService.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/24/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import Alamofire
import SwiftyJSON
import PKHUD

class TRUserService {
    
    static let sharedInstance: TRUserService = TRUserService()
    
    var currentUser: TRUser?
    
    func makeRequest() {
        
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    func success() {
        
        PKHUD.sharedHUD.hide()
    }
    
    func failure() {
        
        PKHUD.sharedHUD.hide()
    }
    
    func loginAPI(userName: String, password: String, success: @escaping () -> (), failure: @escaping () -> ()) {
        
        let URL = "\(baseURL)/signin/login?userName=\(userName)&userPass=\(password)"
        
        makeRequest()
        
        Alamofire.request(URL).validate().responseJSON { (responseData) -> Void in
            
            if let value = responseData.result.value {
                
                let json = JSON(value)
                
                let rows = json["rows"]
                
                let firstRow = rows[0]
                
                if let _ = firstRow["id"].string,
                    let userName = firstRow["userName"].string,
                    let userEmail = firstRow["userEmail"].string {
                    
                    self.setCurrentUser(userName: userName, userEmail: userEmail)
                    
                    self.success()
                    success()
                    
                } else {
                    
                    self.failure()
                    failure()
                }
                
            } else {
                
                self.failure()
                failure()
            }
        }
    }
    
    func signUpAPI(userName: String, userEmail: String, password: String, success: @escaping () -> (), failure: @escaping () -> ()) {
        
        let URL = "\(baseURL)/signup/register"
        
        var parameters = Parameters()
        
        parameters["userName"] = userName
        parameters["userEmail"] = userEmail
        parameters["userPassword"] = password
        
        makeRequest()
        
        Alamofire.request(URL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (responseData) -> Void in
            
            if let _ = responseData.result.value {
                    
                self.setCurrentUser(userName: userName, userEmail: userEmail)
                
                self.success()
                success()
                
            } else {
                
                self.failure()
                failure()
            }
        }
    }
    
    func setCurrentUser(userName: String, userEmail: String) {
        
        currentUser = TRUser(userName: userName, userEmail: userEmail)
    }
}
