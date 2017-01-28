//
//  BookClubMembersViewController.swift
//  BookClub
//
//  Created by Cynthia Whitlatch on 7/14/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class BookClubMembersViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
    }

    func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberlist", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.email
        cell.detailTextLabel?.text = user.membername
        cell.imageView!.image = UIImage(contentsOfFile: user.profileImageUrl!)
        
        return cell
        
        }
}
