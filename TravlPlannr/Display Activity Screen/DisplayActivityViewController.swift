//
//  DisplayActivityViewController.swift
//  TravlPlannrApp
//
//  Created by Patrick Noonan on 6/25/23.
//

import UIKit

class DisplayActivityViewController: UIViewController {
    
    let displayActivityScreen = DisplayActivityView()
    
    override func loadView() {
        view = displayActivityScreen
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func delegateActivityInfoFromActivitiesScreen(activity: Activity) {
        title = activity.name
        displayActivityScreen.dateTitle.text = "Date of Activity: \(activity.date)"
        displayActivityScreen.todoStuffTitle.text = "Things To Do: \(activity.note)"
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
