//
//  BookClubViewController.swift
//  BookClub
//
//  Created by Cynthia Whitlatch on 6/20/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class BookClubViewController: UIViewController, UITableViewDataSource {
    
    var user = [User]()

    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor

    @IBOutlet weak var bookClubName: UILabel!
    @IBOutlet weak var aboutClub: UIButton!
    @IBOutlet weak var bookClubImage: UIImageView!
    @IBOutlet weak var joinClub: UIButton!
    @IBOutlet weak var leaveClub: UIButton!
    @IBOutlet weak var buy: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var memberList: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bookClubImageShow()
        
        let userDefaults = UserDefaults.standard
        bookClubName.text = userDefaults.object(forKey: "NameOfBookClub") as? String
        
    }
    
    func bookClubImageShow() {
//        let myBookClubImage = UserDefaults.standard.object(forKey: "Picture") as! NSData
//        bookClubImage.image = myBookClubImage as! UIImage?
        let imageData = UserDefaults.standard.object(forKey: "Picture") as? NSData
        if let imageData = imageData {
            let picture = UIImage(data:imageData as Data)
            bookClubImage.image = picture
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pastbooksread", for: indexPath)
        cell.textLabel?.text = "Book Title"
        cell.detailTextLabel?.text = "Book Author"
        
        return cell
    }
        
    @IBAction func aboutClub(_ sender: AnyObject) {
        //Club Administrator updates info.   Edit button only appears for administrator
    }
    
    @IBAction func buyButtonPressed(_ sender: AnyObject) {
        //SEGUE TO LOAD WEBVIEW
    }
    
    @IBAction func joinClubPressed(_ sender: AnyObject) {
                //send request to administrator to allow user to join the club
        
        let alertView = UIAlertController(title: "THANK YOU",
                                          message: "Your request has been sent to the Club Administrator for approval" as String, preferredStyle:.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        
        self.present(alertView, animated: true, completion: nil)
        
    }
    
    @IBAction func memberListButtonPressed(_ sender: AnyObject) {
        let bookClubMembersViewController = BookClubMembersViewController()
        let navController = UINavigationController(rootViewController: bookClubMembersViewController)
        present(navController, animated: true, completion: nil)
        
    }
    
    @IBAction func leaveClubPressed(_ sender: AnyObject) {
      //Delete from Club
    }
    
    func customButtons() {
        joinClub.layer.borderColor = buttonBorder
        joinClub.layer.backgroundColor  = buttonColor
        joinClub.layer.borderWidth = 1
        joinClub.layer.cornerRadius = 10
        
        leaveClub.layer.borderColor = buttonBorder
        leaveClub.layer.backgroundColor  = buttonColor
        leaveClub.layer.borderWidth = 1
        leaveClub.layer.cornerRadius = 10
        
        buy.layer.borderColor = buttonBorder
        buy.layer.backgroundColor  = buttonColor
        buy.layer.borderWidth = 1
        buy.layer.cornerRadius = 10
        
        aboutClub.layer.borderColor = buttonBorder
        aboutClub.layer.backgroundColor  = buttonColor
        aboutClub.layer.borderWidth = 1
        aboutClub.layer.cornerRadius = 10
        
        memberList.layer.borderColor = buttonBorder
        memberList.layer.backgroundColor  = buttonColor
        memberList.layer.borderWidth = 1
        memberList.layer.cornerRadius = 10
    }
}
