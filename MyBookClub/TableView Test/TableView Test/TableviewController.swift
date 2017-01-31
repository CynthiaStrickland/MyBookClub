//
//  TableviewController.swift
//  TableView Test
//
//  Created by Cynthia Whitlatch on 1/29/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit
import Foundation

class TableviewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var bookTitleArray = ["Sophie", "Bella", "Cody", "Dayton", "Starbuck"]
    var bookAuthorArray = ["Jack", "Jack", "Jack", "Jack", "Jack"]
    var bookImageArray = [UIImage(named: "owl85.jpg"), UIImage(named: "owl95.jpg"), UIImage(named: "owl100.jpg"), UIImage(named: "owl103.jpg"), UIImage(named: "owl85.jpg")]
    
    var data : [Datasource] = []

    override func viewDidLoad() {
//        loadDatasource()
        
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 67.0
        automaticallyAdjustsScrollViewInsets = false
        
    }
    
    
//    func loadDatasource(){
//        data = []
//        if let path = Bundle.main.path(forResource: "datasource", ofType: "plist"),let datasourceArray = NSArray(contentsOfFile: path){
//
//            for dictionary in datasourceArray {
//                let dictionary = dictionary as! NSDictionary
//                let bookTitle = dictionary.value(forKey: "bookTitle") as? String ?? ""
//                let bookAuthor = dictionary.value(forKey: "bookAuthor") as? String
//                let bookImage = dictionary.value(forKey: "bookImage") as? String
//
//                let data1 = Datasource(bookTitle: bookTitle, bookAuthor: bookAuthor, bookImage: bookImage)
//                data.append(data1)
//
//            }
//        }
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookTitleArray.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as! TableViewCell
        cell.bookImage.image = bookImageArray[indexPath.row]
        cell.bookTitle.text = bookTitleArray[indexPath.row]
        cell.bookAuthor.text = bookAuthorArray[indexPath.row]
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }


}

