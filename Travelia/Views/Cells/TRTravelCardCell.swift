//
//  TRTravelCardCell.swift
//  Travelia
//
//  Created by Adnan Zahid on 2/16/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import SwiftyAvatar
import GoogleMaps

class TRTravelCardCell: UITableViewCell {

    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var travelingTo: UILabel!
    
    @IBOutlet weak var mapView: GMSMapView!
    
    func setupCell(travellingPost: TRTravellingPost) {
        
        fullName.text = String(describing: travellingPost.userId)
        
        travelingTo.text = travellingPost.travelingTo
    }
}
