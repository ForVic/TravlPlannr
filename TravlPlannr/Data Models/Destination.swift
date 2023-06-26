//
//  Destinations.swift
//  TravlPlannrApp
//
//  Created by Patrick Noonan on 6/24/23.
//
import Foundation
import FirebaseFirestoreSwift

struct Destination: Codable{
    @DocumentID var id: String?
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
