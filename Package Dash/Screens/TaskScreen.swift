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
        setupScreen()
    }

    private func setupScreen() {
        // Can be configured later so the user can set their home as home base
        let location = CLLocationCoordinate2D(latitude: 40.912194, longitude: -73.129941)
        let homeBase = HomeBase(title: "Home base", coordinate: location)
        mapView.addAnnotation(homeBase)

        if let task = selectedTask {
            categoryLabel.text = task.category.rawValue
            summaryTextView.text = task.summary
            statusLabel.text = task.status.rawValue
        }

        // Styles the view controller after configuring the screen elements
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

extension TaskScreen: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is HomeBase else { return nil }

        let identifier = "HomeBase"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.pinTintColor = .black

            let button = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = button
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }
}
