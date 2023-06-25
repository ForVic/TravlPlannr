//
//  SearchViewController.swift
//  App14
//
//  Created by Sakib Miazi on 6/15/23.
//

import UIKit
import MapKit

class SearchViewController: UIViewController {

    let searchBottomSheet = SearchBottomSheet()
    var delegateToDestinationsScreen: TravlDestinationsViewController!
    
    var mapItems = [MKMapItem]()
    
    let notificationCenter = NotificationCenter.default

    override func loadView() {
        view = searchBottomSheet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBottomSheet.tableViewSearchResults.delegate = self
        searchBottomSheet.tableViewSearchResults.dataSource = self
        searchBottomSheet.searchBar.delegate = self
        
        searchBottomSheet.tableViewSearchResults.separatorStyle = .none
        
        notificationCenter.addObserver(
            self,
            selector: #selector(notificationForPlaces(notification:)),
            name: .placesFromMap,
            object: nil
        )
        
    }
    
    @objc func notificationForPlaces(notification: Notification) {
        mapItems = notification.object as! [MKMapItem]
        self.searchBottomSheet.tableViewSearchResults.reloadData()
    }
    
}

extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegateToDestinationsScreen.loadPlacesAround(query: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true)
    }
}
