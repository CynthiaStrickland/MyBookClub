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

    var users = ["Cynthia", "Donna"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
    }

    func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberlist", for: indexPath)
        let members = users[indexPath.row]
        cell.textLabel?.text = members
        
        return cell
        
        }
}
