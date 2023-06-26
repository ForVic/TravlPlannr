//
//  ActivitiesViewController.swift
//  TravlPlannrApp
//
//  Created by Patrick Noonan on 6/24/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ActivitiesViewController: UIViewController {
    
    let childProgressView = ProgressSpinnerViewController()
    
    let activitiesScreen = ActivitiesScreenView()
    
    var currentUser:FirebaseAuth.User?
    
    let db = Firestore.firestore()
    
    var currentDestination = Destination(name: "", latitude: 0.0, longitude: 0.0)
    
    var activityNames = [Activity]()
    
    var notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = activitiesScreen
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = currentDestination.name
        
        showActivityIndicator()
        loadActivities()
        
        activitiesScreen.tableViewActivities.delegate = self
        activitiesScreen.tableViewActivities.dataSource = self
        
        activitiesScreen.tableViewActivities.separatorStyle = .none
        // Do any additional setup after loading the view.
        
        activitiesScreen.addActivitesButton.addTarget(self, action: #selector(onAddActivitiesTapped), for: .touchUpInside)
        
        notificationCenter.addObserver(self, selector: #selector(getAddedActivity(notification:)), name: NSNotification.Name("Added Activity"), object: nil)
    }
    
    @objc func getAddedActivity(notification: Notification) {
        var activity = notification.object as! Activity
        activityNames.append(activity)
        addToFirebase(activity: activity)
        activitiesScreen.tableViewActivities.reloadData()
    }
    
    
    @objc func onAddActivitiesTapped() {
        let delegateMapView = ActivitiesMapViewController()
        delegateMapView.delegateDestinationForActivites(destination: currentDestination)
        navigationController?.pushViewController(delegateMapView, animated: true)
    }
    
    func showAlert(message: String, title: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
