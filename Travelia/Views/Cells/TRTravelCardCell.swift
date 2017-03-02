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
        
        fullName.text = travellingPost.fullName
        
        travelingTo.text = travellingPost.travelingTo
        
        drawPath(travelingFromCoordinates: travellingPost.travelingFromCoordinates!, travelingToCoordinates: travellingPost.travelingToCoordinates!)
    }
    
    func drawPath(travelingFromCoordinates: Coordinates, travelingToCoordinates: Coordinates) {
        
        let camera = GMSCameraPosition.camera(withLatitude: travelingFromCoordinates.latitude, longitude: travelingFromCoordinates.longitude, zoom: 2)
        mapView.camera = camera
        
        mapView.isMyLocationEnabled = true
        
        let fromMarker = GMSMarker()
        fromMarker.position = CLLocationCoordinate2DMake(travelingFromCoordinates.latitude, travelingFromCoordinates.longitude)
        fromMarker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        fromMarker.map = mapView
        
        let toMarker = GMSMarker()
        toMarker.position = CLLocationCoordinate2DMake(travelingToCoordinates.latitude, travelingToCoordinates.longitude)
        toMarker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        toMarker.map = mapView
        
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2DMake(travelingFromCoordinates.latitude, travelingFromCoordinates.longitude))
        path.add(CLLocationCoordinate2DMake(travelingToCoordinates.latitude, travelingToCoordinates.longitude))
        
        let rectangle = GMSPolyline.init(path: path)
        rectangle.strokeWidth = 2.0
        rectangle.map = mapView
    }
}
