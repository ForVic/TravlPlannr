//
//  ActivitiesNearbyManager.swift
//  TravlPlannrApp
//
//  Created by Patrick Noonan on 6/25/23.
//

import Foundation
import MapKit

extension ActivitiesMapViewController {
    func requestNearbyActivities() {
        
        var region = MKCoordinateRegion()
        region.center = CLLocationCoordinate2D(latitude: self.currentDestination.coordinate.latitude, longitude: self.currentDestination.coordinate.longitude)
        
        let searchRequest = MKLocalPointsOfInterestRequest(center: region.center, radius: 10000)
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                // Handle the error.
                self.showAlert(message: "Failed getting Local Activities", title: "Error!")
                return
            }
            if (response.mapItems.count != 0) {
                for item in response.mapItems {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    annotation.subtitle = item.phoneNumber
                    
                    let placeOfInterest = Place(title: annotation.title!, coordinate: annotation.coordinate, info: "Activity")
                    
                    DispatchQueue.main.async {
                        self.mapView.mapView.addAnnotation(placeOfInterest)
                    }
                }
            } else {
                self.showAlert(message: "Did not find any Activities near the selected Destination. Try another Destination.", title: "Warning!")
            }
        }
    }
    
    func showAlert(message: String, title: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
