//
//  TaskScreen.swift
//  Package Dash
//
//  Created by Jerry Turcios on 2/8/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import MapKit
import UIKit

enum Points {
    static let homeBaseLocation = CLLocationCoordinate2D(latitude: 40.912194, longitude: -73.129941)
    // dunkin donuts
    //    static let checkpointLocation = CLLocationCoordinate2D(latitude: 40.921366, longitude: -73.128926)
    static let checkpointLocation = CLLocationCoordinate2D(latitude: 40.91218, longitude: -73.129941)

}

class TaskScreen: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var summaryTextView: UITextView!
    @IBOutlet var statusLabel: UILabel!

    var locationManager: CLLocationManager!
    var selectedTask: Task?

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        generateRoute()
        obtainLocation()
        setupScreen()
    }

    // MARK: - MapView methods

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("LOCATION CHANGED!")
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .blue
        renderer.lineWidth = 4.0

        return renderer
    }

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

    // MARK: - Routing methods

    private func generateRoute() {
        mapView.delegate = self

        let sourceLocation = Points.homeBaseLocation
        let checkpointLocation = Points.checkpointLocation

        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation)
        let checkpointPlacemark = MKPlacemark(coordinate: checkpointLocation)

        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let checkpointMapItem = MKMapItem(placemark: checkpointPlacemark)

        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = checkpointMapItem
        directionRequest.transportType = .walking

        let directions = MKDirections(request: directionRequest)

        directions.calculate { (response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }

                return
            }

            let route = response.routes[0]
            self.mapView.addOverlays([route.polyline], level: .aboveRoads)
        }
    }

    private func obtainLocation() {
        // Configure location manager
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        mapView.showsUserLocation = true

        // Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }

        // Zoom to the user's location
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(viewRegion, animated: false)
        }

        self.locationManager = locationManager

        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
    }

    // MARK: - User interface methods

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
        case "In progress":
            statusLabel.textColor = .systemBlue
        default:
            statusLabel.textColor = .systemGray
        }
    }
}
