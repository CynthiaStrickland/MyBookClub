//
//  MapViewViewController.swift
//  MyBookClub
//
//  Created by Cynthia Whitlatch on 2/2/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps



class MapViewViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 37.80948,
                                              longitude: 5.965699,
                                              zoom: 2)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        
        // Available map types: kGMSTypeNormal, kGMSTypeSatellite, kGMSTypeHybrid,
        // kGMSTypeTerrain, kGMSTypeNone
        
        // Set the mapType to Satellite
        mapView.mapType = kGMSTypeSatellite
        view = mapView
    }
}
