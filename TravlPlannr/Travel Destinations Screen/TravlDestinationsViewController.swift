//
//  TravlDestinationsViewController.swift
//  TravlPlannr
//
//  Created by Patrick Noonan on 6/16/23.
//
import UIKit
import FirebaseAuth

class TravlDestinationsViewController: UIViewController {

    let destinationsScreen = TravlDestinationsView()

    var currentUser:FirebaseAuth.User?
    
    let destinations = [String]()

    override func loadView() {
        view = destinationsScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Messenger"

        destinationsScreen.tableViewDestinations.delegate = self
        destinationsScreen.tableViewDestinations.dataSource = self

        destinationsScreen.tableViewDestinations.separatorStyle = .none

        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddButtonTapped))
    }

    @objc func onAddButtonTapped() {
        //TODO: will do something more when more screens get added.
        print("Add Destination Button Pressed.")
    }

}
