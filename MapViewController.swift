//
//  MapViewController.swift
//  MyBookClub
//
//  Created by Cynthia Whitlatch on 1/31/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor
    

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customButtons()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customButtons() {
        cancelButton.layer.borderColor = buttonBorder
        cancelButton.layer.backgroundColor  = buttonColor
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.cornerRadius = 10
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
