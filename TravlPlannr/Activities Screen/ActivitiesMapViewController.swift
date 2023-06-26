//
//  ActivitiesMapViewController.swift
//  TravlPlannrApp
//
//  Created by Patrick Noonan on 6/24/23.
//

import UIKit
import MapKit

class ActivitiesMapViewController: UIViewController {
    let mapView = ActivitiesMapView()
    
    var currentDestination = CLLocation()
    
    override func loadView() {
        view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map of Activities"
        
        mapView.mapView.isZoomEnabled = false
        mapView.mapView.isScrollEnabled = false
        mapView.mapView.centerToLocation(location: currentDestination)
        requestNearbyActivities()
        mapView.mapView.delegate = self
    }
    
    
    func delegateDestinationForActivites(destination: Destination) {
        print(destination.latitude)
        let currentLocation = CLLocation(latitude: destination.latitude, longitude: destination.longitude)
        currentDestination = currentLocation
    }

}

extension MKMapView{
    func centerToLocation(location: CLLocation, radius: CLLocationDistance = 1000){
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: radius,
            longitudinalMeters: radius
        )
        setRegion(coordinateRegion, animated: true)
    }
}
