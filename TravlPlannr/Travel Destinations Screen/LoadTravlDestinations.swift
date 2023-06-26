//
//  LoadTravlDestinations.swift
//  App14
//
//  Created by Sakib Miazi on 6/15/23.
//

import Foundation
import CoreLocation
import MapKit

extension TravlDestinationsViewController{
    func loadPlacesAround(query: String){
        let notificationCenter = NotificationCenter.default
        
        var mapItems = [MKMapItem]()
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query

        let region = MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        // Set the region to an associated map view's region.
        searchRequest.region = region


        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                // Handle the error.
                return
            }
            mapItems = response.mapItems
            
            for item in response.mapItems {
                if let name = item.name,
                    let location = item.placemark.location {
                    print("\(name), \(location)")
                }
            }
            
            notificationCenter.post(name: .placesFromMap, object: mapItems)
        }
    }
}
