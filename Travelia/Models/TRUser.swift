//
//  TRUser.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/24/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import Foundation

class TRUser {
    
    var id: Int?
    var userName: String
    var userEmail: String
    
    var firstName: String?
    var lastName: String?
    
    init(userName: String, userEmail: String) {
        
        self.userName = userName
        self.userEmail = userEmail
    }
}
