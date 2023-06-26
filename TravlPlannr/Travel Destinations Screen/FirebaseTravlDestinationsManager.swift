//
//  FirebaseTravlDestinationsManager.swift
//  TravlPlannr
//
//  Created by Victor Sunderland on 6/24/23.
//

import Foundation
import FirebaseFirestore
import CoreLocation

extension TravlDestinationsViewController{
    func loadTravlDestinations() {
        self.destinationsScreen.tableViewDestinations.reloadData()
        if let uwcurrentUser = currentUser {
            db.collection(Configs.userCollectionName)
                .document(uwcurrentUser.email!.lowercased())
                .collection("travlDestinations")
                .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                    if let documents = querySnapshot?.documents{
                        self.locationNames.removeLast(self.locationNames.count - 1)
                        for document in documents{
                            do{
                                let travlDestination = try document.data(as: Destination.self)
                                self.nameToDestinationMap[travlDestination.name] = travlDestination
                                self.locationMap[travlDestination.name] = CLLocation(latitude: travlDestination.latitude, longitude: travlDestination.longitude)
                                self.locationNames.append(travlDestination.name)
                                self.hideActivityIndicator()
                            } catch{
                                print(error)
                            }
                        }
                        self.destinationsScreen.tableViewDestinations.reloadData()
                    }
                })
        }
    }
    
    
    func addToFirebase(destination: Destination) {
        if let uwcurrentUser = currentUser {
            let collectionsDestination = db
                .collection(Configs.userCollectionName)
                .document(uwcurrentUser.email!)
                .collection("travlDestinations")
            do {
                let docref = try collectionsDestination.addDocument(from: destination, completion: {(error) in
                    if error == nil {
                        
                    }
                })
            } catch {
                self.showAlert(message: "Couldn't add destination", title: "Error!")
            }
        } else {
            self.showAlert(message: "Invalid user!", title: "Error!")
        }
    }
    
    func removeFromFirebase(destination: Destination) {
        if let uwcurrentUser = currentUser {
            db.collection(Configs.userCollectionName)
                .document(uwcurrentUser.email!)
                .collection("travlDestinations")
                .document(destination.id!)
                .delete() { err in
                    if let err = err {
                        self.showAlert(message:"Couldn't remove destination: \(err)", title: "Error!")
                    } else {
                        print("Document successfully removed!")
                    }
                }
        }
    }
}
