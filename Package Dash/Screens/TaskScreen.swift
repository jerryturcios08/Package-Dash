//
//  TaskScreen.swift
//  Package Dash
//
//  Created by Jerry Turcios on 2/8/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import MapKit
import UIKit

class TaskScreen: UIViewController {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var summaryTextView: UITextView!
    @IBOutlet var statusLabel: UILabel!

    var selectedTask: Task?

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let task = selectedTask {
            categoryLabel.text = task.category.rawValue
            summaryTextView.text = task.summary
            statusLabel.text = task.status.rawValue
        }

        setupStyling()
    }

    private func setupStyling() {
        // Configure category label
        categoryLabel?.font = .boldSystemFont(ofSize: 30)

        // Configure summary text view
        summaryTextView.isEditable = false
        summaryTextView.isSelectable = false

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
