//
//  AboutViewController.swift
//  BookClub
//
//  Created by Cynthia Whitlatch on 6/23/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    var clubInfo = [User]()

    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor
    
    @IBOutlet weak var clubMeetingDateTimeLocation: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBAction func doneButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
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
        }
    }
