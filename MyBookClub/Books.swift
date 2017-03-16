//
//  Books.swift
//  Book Club
//
//  Created by Cynthia Whitlatch on 10/8/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class Books: NSObject {
    
    var dictionaryOfBooksRead = [String:String]()

    var titleOfBook : String?
    var authorOfBook : String?
    var bookImage: UIImage?
}

class Club: NSObject {
    var aboutclub: String?
    var clubImage: UIImage?
    var clubdatetimelocation: String?
    var clubname: String?
    var clubBooksReadTitle: String?
    var clubBooksReadAuthor: String?
    
    var dateBookRead : String?
    var bookRating: String?
    var bookSuggestions: String?
    var bookClubNotes: String?
    
}
