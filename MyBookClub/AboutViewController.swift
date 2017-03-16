//
//  AboutViewController.swift
//  BookClub
//
//  Created by Cynthia Whitlatch on 6/23/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import MapKit


class AboutViewController: UIViewController {

    var clubInfo = [Member]()

    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor
    
    @IBOutlet weak var aboutText: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var locationName: UITextField!
    @IBOutlet weak var directions: UIButton!
    @IBOutlet weak var locationTime: UITextField!
    @IBOutlet weak var locationDate: UITextField!
    @IBOutlet weak var locationAddress: UITextView!
    
    
    @IBAction func directionsToClub(_ sender: UIButton) {
      
//        var address = locatinAddress.text
//        var geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(address, {(placemarks: [AnyObject]!, error: NSError!) -> Void in
//            if let placemark = placemarks?[0] as? CLPlacemark {
//                self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
//            }
//        })
        
    }
    
    @IBAction func doneButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAboutBookClub(_ sender: UIButton) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func customButtons() {
        doneButton.layer.borderColor = buttonBorder
        doneButton.layer.backgroundColor  = buttonColor
        doneButton.layer.borderWidth = 1
        doneButton.layer.cornerRadius = 10
        
        saveButton.layer.borderColor = buttonBorder
        saveButton.layer.backgroundColor  = buttonColor
        saveButton.layer.borderWidth = 1
        saveButton.layer.cornerRadius = 10
        
        directions.layer.borderColor = buttonBorder
        directions.layer.backgroundColor  = buttonColor
        directions.layer.borderWidth = 1
        directions.layer.cornerRadius = 10
        }
    }
