//
//  TRUserData.swift
//  Travelia
//
//  Created by Adnan Zahid on 2/22/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import Foundation

class TRUserData {
    
    static func getUser() -> TRUser? {
        
        let data = UserDefaults.standard.data(forKey: "user")
        
        var user: TRUser?
        
        if data != nil {
            
            user = NSKeyedUnarchiver.unarchiveObject(with: data!) as? TRUser
            
            if user != nil {
                
                TRUser.sharedInstance.setupUser(user: user!)
            }
        }
        
        return user
    }
    
    static func setUser(user: TRUser) {
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(encodedData, forKey: "user")
    }
}
