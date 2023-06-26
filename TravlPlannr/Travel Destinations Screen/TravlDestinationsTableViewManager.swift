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
        return locationNames.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return (locationNames[indexPath.row] != "Current Location")
    }

    func tableView(_ tableView: UITableView, commit editingstyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingstyle == .delete {
            let currentName = locationNames.remove(at: indexPath.row)
            removeFromFirebase(destination: nameToDestinationMap[currentName]!)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "destinations", for: indexPath) as! TravlDestinationsTableViewCell
        cell.labelDestination.text = locationNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (locationNames[indexPath.row] == "Current Location") {
            promptUserToNameLocation()
        } else {
            let selectedName = locationNames[indexPath.row]
            let selectedLocationIndex = locationMap.index(forKey: selectedName)!
            let selectedLocation = locationMap[selectedLocationIndex].value
            let destination = nameToDestinationMap[selectedName]!
            delegateToActivitiesScreen(destination: destination)
        }
        
    }
    
    func promptUserToNameLocation() {
        let nameLocationAlert = UIAlertController(
            title: "Name Current Location",
            message: "Please provide a name for current location",
            preferredStyle: .alert)
        
        nameLocationAlert.addTextField{ textField in
            textField.placeholder = "Enter name of current location"
            textField.contentMode = .center
            textField.keyboardType = .default
        }
        
        let nameLocationAction = UIAlertAction(title: "Confirm", style: .default, handler: { [self](_) in
            if let name = nameLocationAlert.textFields![0].text {
                if !name.isEmpty {
                    self.locationMap.updateValue(self.currentLocation, forKey: name)
                    self.locationNames.append(name)
                    
                    self.destinationsScreen.tableViewDestinations.reloadData()
                    let destination = Destination(name: name, latitude: self.currentLocation.coordinate.latitude, longitude: self.currentLocation.coordinate.longitude)
                    self.nameToDestinationMap[name] = destination
                    self.addToFirebase(destination: destination)
                    
                    print("Destination is init here")
                    print(destination.latitude)
                    print(destination.longitude)
                    self.delegateToActivitiesScreen(destination: destination)
                } else {
                    self.showAlert(message: "Name cannot be blank", title: "Current Location Name not specified")
                }
            }
        })
            
        nameLocationAlert.addAction(nameLocationAction)
        
        self.present(nameLocationAlert, animated: true, completion: {() in
            nameLocationAlert.view.superview?.isUserInteractionEnabled = true
            nameLocationAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })
    }
    
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
    }
    
    
    func showAlert(message: String, title: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
