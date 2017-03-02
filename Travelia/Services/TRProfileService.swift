//
//  TRProfileService.swift
//  Travelia
//
//  Created by Adnan Zahid on 2/23/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import Alamofire
import SwiftyJSON

class TRProfileService: Service {
    
    func otherProfileAPI(id: Int, success: @escaping () -> (), failure: @escaping () -> ()) {
        
        let URL = "\(baseURL)/user/showprofile?requestorId=3&requestedId=\(id)"
        
        makeRequest()
        
        Alamofire.request(URL).validate().responseJSON { (responseData) -> Void in
            
            if let value = responseData.result.value {
                
                let json = JSON(value)
                
                if self.isError(value: json) == false {
                    
                    let data = json["UserProfileDto"]
                    
                    self.populateData(value: data)
                    
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
    
    func editProfileAPI(id: Int, fullName: String, description: String, totalNumberOfPost: Int, numberOfFollowers: Int, success: @escaping () -> (), failure: @escaping () -> ()) {
        
        let URL = "\(baseURL)/user/addprofile?requestedId=\(id)"
        
        var parameters = Parameters()
        
        parameters["profileName"] = fullName
        parameters["desc"] = description
        
        parameters["totalNumberOfPost"] = totalNumberOfPost
        parameters["numberOfFollowers"] = numberOfFollowers

        makeRequest()
        
        Alamofire.request(URL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (responseData) -> Void in
            
            if let _ = responseData.result.value {
                
                self.success()
                success()
                
            } else {
                
                self.failure()
                failure()
            }
        }
    }
}
