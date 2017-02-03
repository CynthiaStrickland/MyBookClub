//
//  PinAnnotation.swift
//  MyBookClub
//
//  Created by Cynthia Whitlatch on 2/3/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import MapKit

class MKPinAnnotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String?, subtitle:String?, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

class CustomPointAnnotation: MKPointAnnotation {
    var pinCustomImageName:String!
}
