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
    let memberAdmin: Bool?
    let memberApproved: Bool?
    
    init(memberFirstName: String, memberLastName: String, memberEmail: String, memberAdmin: Bool, memberApproved: Bool) {
        self.memberFirstName = memberFirstName
        self.memberLastName = memberLastName
        self.memberEmail = memberEmail
        self.memberAdmin = memberAdmin
        self.memberApproved = memberApproved
    }
}
