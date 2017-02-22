//
//  TRUser.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/24/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import Foundation

class TRUser: NSObject, NSCoding {
    
    static let sharedInstance: TRUser = TRUser()
    
    var id: Int?
    var userName: String?
    var userEmail: String?
    
    var firstName: String?
    var lastName: String?
    
    func setupUser(user: TRUser) {
        
        setupUser(id: user.id!, userName: user.userName!, userEmail: user.userEmail!)
    }
    
    func setupUser(id: Int, userName: String, userEmail: String) {
        
        self.id = id
        self.userName = userName
        self.userEmail = userEmail
        
        TRUserData.setUser(user: self)
    }
    
    override init() {
        super.init()
    }
    
    required init(coder decoder: NSCoder) {
        
        self.id = decoder.decodeObject(forKey: "id") as? Int
        self.userName = decoder.decodeObject(forKey: "userName") as? String
        self.userEmail = decoder.decodeObject(forKey: "userEmail") as? String
    }
    
    func encode(with coder: NSCoder) {
        
        coder.encode(id, forKey: "id")
        coder.encode(userName, forKey: "userName")
        coder.encode(userEmail, forKey: "userEmail")
    }
}
