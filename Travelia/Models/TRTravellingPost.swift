//
//  TRTravellingPost.swift
//  Travelia
//
//  Created by Adnan Zahid on 2/20/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import SwiftyJSON

class TRTravellingPost {
    
    let fullName: String?
    let description: String?
    let travelingStatus: String?
    
    let postedTime: TimeInterval?
    
    let travelingTo: String?
    let travelingFrom: String?
    
    let travelingToCoordinates: Coordinates?
    let travelingFromCoordinates: Coordinates?
    
    init(value: JSON) {
        
        self.fullName = value["userProfileName"].string
        self.description = value["description"].string
        self.travelingStatus = value["travelingStatus"].string
        
        self.postedTime = value["postedTime"].double
        
        self.travelingTo = value["travelingTo"].string
        self.travelingFrom = value["travelingFrom"].string
        
        self.travelingToCoordinates = Coordinates(latitude: value["travelingToLatitude"].double!, longitude: value["travelingToLongitude"].double!)
        self.travelingFromCoordinates = Coordinates(latitude: value["travelingFromLatitude"].double!, longitude: value["travelingFromLongitude"].double!)
    }
    
    static func getTravellingPosts(value: JSON) -> [TRTravellingPost] {
        
        var travellingPostsArray: [TRTravellingPost] = []
        
        for i in 0 ..< value.count {
            
            travellingPostsArray.append(TRTravellingPost(value: value[i]))
        }
        
        return travellingPostsArray
    }
}
