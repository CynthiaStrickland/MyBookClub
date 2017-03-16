//
//  Member.swift
//  MyBookClub
//
//  Created by Cynthia Whitlatch on 2/23/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class Member {
    let memberFirstName: String?
    let memberLastName: String?
    let memberEmail: String?
    let memberProfileImage: UIImageView?
    let memberAdmin: Bool?
    let memberApproved: Bool?
    
    init(memberFirstName: String, memberLastName: String, memberEmail: String, memberProfileImage: UIImageView, memberAdmin: Bool, memberApproved: Bool) {
        self.memberFirstName = memberFirstName
        self.memberLastName = memberLastName
        self.memberEmail = memberEmail
        self.memberProfileImage = memberProfileImage
        self.memberAdmin = memberAdmin
        self.memberApproved = memberApproved
    }
}
