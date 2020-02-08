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
        // Sets the cell's properties using the properties of the task argument
        taskImageView.image = task.image
        categoryLabel.text = task.category.rawValue
        summaryLabel.text = task.summary
        statusLabel.text = task.status.rawValue

        setupStyling()
    }

    private func setupStyling() {
        // Configure table view cell properties
        selectionStyle = .none

        // Configure task image view styling
        taskImageView.layer.cornerRadius = taskImageView.frame.height / 2

        // Configure category label styling
        categoryLabel.font = .boldSystemFont(ofSize: 20)

        // Configure status label styling
        switch statusLabel.text {
        case "Ready":
            statusLabel.textColor = .systemGreen
        case "In Progress":
            statusLabel.textColor = .systemBlue
        default:
            statusLabel.textColor = .systemGray
        }
    }
}
