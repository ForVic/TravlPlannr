//
//  FirebaseTravlDestinationsManager.swift
//  TravlPlannr
//
//  Created by Victor Sunderland on 6/24/23.
//

import Foundation
import CoreLocation
import FirebaseFirestore

extension ActivitiesViewController{
    func loadActivities() {
        self.db.collection("users")
        .document((self.currentUser?.email)!)
        .collection("travlDestinations")
        .document(currentDestination.id!)
        .collection("activities")
        .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
            if let documents = querySnapshot?.documents{
                self.activityNames.removeAll()
                for document in documents{
                    do{
                        let activity = try document.data(as: Activity.self)
                        self.activityNames.append(activity)
                    } catch{
                        self.showAlert(message: "Couldn't load activities", title: "Error!")
                    }
                }
                self.activityNames.reverse()
                self.activitiesScreen.tableViewActivities.reloadData()
            }
            self.hideActivityIndicator()
        })
    }
    
    func addToFirebase(activity: Activity) {
        if let uwcurrentUser = currentUser {
            let addRef = db.collection(Configs.userCollectionName)
                .document(uwcurrentUser.email!)
                .collection("travlDestinations")
                .document(currentDestination.id!)
                .collection("activities")
            do {
                try addRef.addDocument(from: activity, completion: { (error) in
                    if error == nil {
                    }
                })
            } catch {
                self.showAlert(message: "Couldn't add activity to database, try again! + \(error)", title: "Error!")
            }
        } else {
            self.showAlert(message: "Couldn't add activity to database, try again!", title: "Error!")
        }
    }
    
    func removeFromFirebase(activity: Activity) {
        if let uwcurrentUser = currentUser {
            db.collection(Configs.userCollectionName)
                .document(uwcurrentUser.email!)
                .collection("travlDestinations")
                .document(currentDestination.id!)
                .collection("activities")
                .document(activity.id!)
                .delete() { err in
                    if let err = err {
                        self.showAlert(message:"Couldn't remove document: \(err)", title: "Error!")
                    } else {
                        print("Document successfully removed!")
                    }
                }
        }
    }
}
