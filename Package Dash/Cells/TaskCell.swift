//
//  TaskCell.swift
//  Package Dash
//
//  Created by Jerry Turcios on 2/8/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet var taskImageView: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!

    func setupCell(task: Task) {
    }
}
