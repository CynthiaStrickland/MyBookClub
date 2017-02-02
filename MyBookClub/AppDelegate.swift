//
//  AppDelegate.swift
//  MyBookClub
//
//  Created by Cynthia Whitlatch on 1/28/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        GMSServices.provideAPIKey("AIzaSyBSawKCiw00BJ4LtmYMbPpa2K5nZ1mhjc0")
        GMSPlacesClient.provideAPIKey("AIzaSyBSawKCiw00BJ4LtmYMbPpa2K5nZ1mhjc0")
        
        return true
    }
}

