//
//  TRUserService.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/24/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import Alamofire
import SwiftyJSON

class TRUserService: Service {
    
    func loginAPI(userName: String, password: String, success: @escaping () -> (), failure: @escaping () -> ()) {
        
        let URL = "\(baseURL)/signin/login?userName=\(userName)&userPass=\(password)"
        
        makeRequest()
        
        Alamofire.request(URL).validate().responseJSON { (responseData) -> Void in
            
            if let value = responseData.result.value {
                
                let json = JSON(value)
                
                if self.isError(value: json) == false {
                
                    let data = json["UserDto"]
                    
                    if let id = Int(data["id"].string!),
                        let userName = data["userName"].string,
                        let userEmail = data["userEmail"].string {
                        
                        self.setCurrentUser(id: id, userName: userName, userEmail: userEmail)
                        
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
            
            if let value = responseData.result.value {
                
                let json = JSON(value)
                
                if self.isError(value: json) == false {
                    
                    let data = json["UserDto"]
                    
                    if let id = Int(data["id"].string!) {
                        
                        self.setCurrentUser(id: id, userName: userName, userEmail: userEmail)
                        
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
            } else {
                
                self.failure()
                failure()
            }
        }
    }
    
    func setCurrentUser(id: Int, userName: String, userEmail: String) {
        
        TRUser.sharedInstance.setupUser(id: id, userName: userName, userEmail: userEmail)
    }
}
