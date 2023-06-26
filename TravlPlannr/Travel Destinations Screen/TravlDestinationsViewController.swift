//
//  TravlDestinationsViewController.swift
//  TravlPlannr
//
//  Created by Patrick Noonan on 6/16/23.
//
import UIKit
import FirebaseAuth
import CoreLocation
import MapKit
import FirebaseFirestore
import FirebaseFirestoreSwift

class TravlDestinationsViewController: UIViewController {
    
    let childProgressView = ProgressSpinnerViewController()

    let destinationsScreen = TravlDestinationsView()

    var currentUser:FirebaseAuth.User?
    
    let db = Firestore.firestore()
    
    var locationNames = [String]()
    
    var nameToDestinationMap = [String: Destination]()
    
    var locationMap = [String: CLLocation]()
    
    let locationManager = CLLocationManager()
    
    var currentLocation = CLLocation()

    override func loadView() {
        view = destinationsScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Travl Destinations"
        
        showActivityIndicator()
        setupLocationManager()
        loadTravlDestinations()

        destinationsScreen.tableViewDestinations.delegate = self
        destinationsScreen.tableViewDestinations.dataSource = self

        destinationsScreen.tableViewDestinations.separatorStyle = .none

        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddButtonTapped))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       // TODO: Listener for DB updates
        // Maybe something like this setup
        // db.collection("user").document(userId).collection("location").addSnapShotListener()
        // not sure how we want to setup the db so I'll leave that to you Victor
    }

    @objc func onAddButtonTapped() {
        //MARK: Setting up bottom search sheet...
         let searchViewController  = SearchViewController()
         searchViewController.delegateToDestinationsScreen = self
         
         let navForSearch = UINavigationController(rootViewController: searchViewController)
         navForSearch.modalPresentationStyle = .pageSheet
         
         if let searchBottomSheet = navForSearch.sheetPresentationController{
             searchBottomSheet.detents = [.medium(), .large()]
             searchBottomSheet.prefersGrabberVisible = true
         }
         
         present(navForSearch, animated: true)
    }
    
    func addSearchedLocation(placeItem: MKMapItem) {
        // Add name as key to coordinate value in locationMap to store data
        // TODO: Add Collection and Document for Location
        // Maybe something like db.collection("user).document(userId).collection("location").addDocument()
        
        let selectedLocationName = "\(placeItem.name!)"
        let selectedLocationCoordinates = placeItem.placemark.coordinate
        let selectedLocation = CLLocation(latitude: selectedLocationCoordinates.latitude, longitude: selectedLocationCoordinates.longitude)
        locationMap.updateValue(selectedLocation, forKey: selectedLocationName)
        locationNames.append("\(selectedLocationName)")
        let currdestination = Destination(name: selectedLocationName, latitude: selectedLocationCoordinates.latitude, longitude: selectedLocationCoordinates.longitude)
        nameToDestinationMap[selectedLocationName] = currdestination
        addToFirebase(destination: currdestination)
        destinationsScreen.tableViewDestinations.reloadData()
    }
    
    func delegateToActivitiesScreen(destination: Destination) {
        //TODO: Make Activity Screen then delegate destination and push Controller
        let delegateActivities = ActivitiesViewController()
        delegateActivities.currentUser = currentUser
        delegateActivities.currentDestination = destination
        navigationController?.pushViewController(delegateActivities, animated: true)
    }

}
