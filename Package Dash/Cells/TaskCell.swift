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
        taskImageView.image = task.image
        categoryLabel.text = task.category.rawValue
        summaryLabel.text = task.summary
        statusLabel.text = task.category.rawValue

        setupStyling()
    }

    private func setupStyling() {
        taskImageView.layer.cornerRadius = taskImageView.frame.height / 2
    }
}
