//
//  ActivitesTableViewManager.swift
//  App14
//
//  Created by Patrick Noonan on 6/24/23.
//

import Foundation
import UIKit

extension ActivitiesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activities", for: indexPath) as! ActivitiesTableViewCell
        cell.labelTitle.text = activityNames[indexPath.row].name
        cell.labelDate.text = activityNames[indexPath.row].date
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let activity = activityNames.remove(at: indexPath.row)
            removeFromFirebase(activity: activity)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var delegateDisplayActivityScreen = DisplayActivityViewController()
        
        let selectedActivity = activityNames[indexPath.row]
        
        delegateDisplayActivityScreen.delegateActivityInfoFromActivitiesScreen(activity: selectedActivity)
        navigationController?.pushViewController(delegateDisplayActivityScreen, animated: true)
    }
}
