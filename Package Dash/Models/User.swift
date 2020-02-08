//
//  User.swift
//  Package Dash
//
//  Created by Jerry Turcios on 2/8/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import UIKit

enum Rank: String {
    case rookie = "Rookie"
    case survivor = "Survivor"
    case hunter = "Hunter"
    case leader = "Leader"
}

class User {
    var avatar: UIImage
    var name: String
    var joinedSinceDate: Date
    var rank: Rank

    init(avatar: UIImage, name: String, joinedSinceDate: Date, rank: Rank) {
        self.avatar = avatar
        self.name = name
        self.joinedSinceDate = joinedSinceDate
        self.rank = rank
    }
}
