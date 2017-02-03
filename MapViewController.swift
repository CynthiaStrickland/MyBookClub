//
//  MapViewController.swift
//  MyBookClub
//
//  Created by Cynthia Whitlatch on 2/2/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

import GooglePlaces
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    
    fileprivate let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 37.621262,
                                              longitude: -122.378945,
                                              zoom: 10)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.mapType = kGMSTypeSatellite
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(37.621262, -122.378945)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "SFO Airport"
        marker.map = mapView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(MapViewController.next as (MapViewController) -> () -> ()))
        
    }
    
    func next() {
        
    }
}

