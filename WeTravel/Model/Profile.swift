//
//  Profile.swift
//  WeTravel
//
//  Created by GHTK on 30/7/24.
//

import Foundation

struct Profile{
    var name: String
}

class ProfileCell{
    static let profileCells = [
        Profile(name : "Person Information"),
        Profile(name : "Address"),
        Profile(name : "Notifications"),
        Profile(name : "Payment Method"),
        Profile(name : "Settings"),
        Profile(name : "Logout"),
    ]
}

