//
//  MyHomeTableviewCell.swift
//  MyBookClub
//
//  Created by Cynthia Whitlatch on 1/28/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class MyHomeTableviewCell: UITableViewCell {

    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
