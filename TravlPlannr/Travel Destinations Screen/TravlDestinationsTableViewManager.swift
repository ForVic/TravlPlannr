//
//  File.swift
//  TravlPlannr
//
//  Created by Patrick Noonan on 6/16/23.
//

import Foundation
import UIKit

extension TravlDestinationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "destinations", for: indexPath) as! TravlDestinationsTableViewCell
        
        cell.labelDestination.text = "Current Destination"
        
        return cell
        
    }
}
