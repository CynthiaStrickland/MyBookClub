//
//  DATASOURCE.swift
//  TableView Test
//
//  Created by Cynthia Whitlatch on 1/29/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import Foundation

class Datasource: NSObject {

    var bookTitle : String?
    var bookAuthor : String?
    var bookImage: String?
    
    convenience init(bookTitle:String!, bookAuthor:String?, bookImage:String?) {
        self.init()
        self.bookTitle = bookTitle
        self.bookAuthor = bookAuthor
        self.bookImage = bookImage
    }
}
