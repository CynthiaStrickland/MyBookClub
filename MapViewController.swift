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

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    fileprivate let locationManager = CLLocationManager()
    var pointAnnotation: CustomPointAnnotation!
    var pinAnnotationView: MKPointAnnotation!
    var customPinImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.008, 0.008)
        
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        let pin = MKPinAnnotation(title: "Hey I'm Here", subtitle: "Come Join ME!", coordinate: myLocation)
        mapView.addAnnotation(pin)
        
        mapView.setRegion(region, animated: true)
        mapView.mapType = MKMapType.standard
            print(location.altitude)
            print(location.speed)
        
        self.mapView.showsUserLocation = true
        
        locationManager.stopUpdatingLocation()
        
    }
}

    


