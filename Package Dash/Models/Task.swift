//
//  Task.swift
//  Package Dash
//
//  Created by Jerry Turcios on 2/8/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import UIKit

enum Category: String {
    case packageCollector = "Package Collector" // package collector does not require more than 3 miles
    case relocation = "Relocation" // relocation involves running more than 3 miles, it is more rare for this to happen
    // add more event types
}

enum Status: String {
    case ready = "Ready"
    case inProgress = "In progress"
    case completed = "Completed"
}

class Task {
    var image: UIImage
    var category: Category
    var summary: String
    var status: Status
    // Add properties to be integrated with mapkit/GPS

    init(image: UIImage, category: Category, summary: String, status: Status) {
        self.image = image
        self.category = category
        self.summary = summary
        self.status = status
    }
}
