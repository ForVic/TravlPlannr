//
//  TravlDestinationsViewController.swift
//  TravlPlannr
//
//  Created by Patrick Noonan on 6/16/23.
//

import UIKit

class TravlDestinationsViewController: UIViewController {
    
    let destinationsScreen = TravlDestinationsView()
    
    let destinations = [String]()
    
    override func loadView() {
        view = destinationsScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Messenger"
        
        //MARK: patching table view delegate and data source...
        destinationsScreen.tableViewDestinations.delegate = self
        destinationsScreen.tableViewDestinations.dataSource = self
        
        //MARK: removing the separator line...
        destinationsScreen.tableViewDestinations.separatorStyle = .none
        
        //MARK: Make the titles look large...
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddButtonTapped))
    }
    
    @objc func onAddButtonTapped() {
        // will do something more when more screens get added.
        
        
        print("Add Destination Button Pressed.")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
