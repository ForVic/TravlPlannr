//
//  CurrentLocationManager.swift
//  TravlPlannrApp
//
//  Created by Patrick Noonan on 6/24/23.
//

import Foundation
import CoreLocation

extension TravlDestinationsViewController: CLLocationManagerDelegate{
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse
            || manager.authorizationStatus == .authorizedAlways {
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = manager.location!
        print(manager.location!.description)
        locationNames.append("Current Location")
        destinationsScreen.tableViewDestinations.reloadData()
        
        print(currentLocation.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location error: \(error.localizedDescription)")
    }
    
}
