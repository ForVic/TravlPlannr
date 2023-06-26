//
//  AddActivitiesViewController.swift
//  TravlPlannrApp
//
//  Created by Patrick Noonan on 6/25/23.
//

import UIKit

class AddActivitiesViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    
    let addActivitiesScreen = AddActivitiesView()
    
    var selectedDate:String = Date().formatted(date: .numeric, time: .omitted)

    override func loadView() {
        view = addActivitiesScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addActivitiesScreen.datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        addActivitiesScreen.buttonAddActivity.addTarget(self, action: #selector(onAddActivityButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        selectedDate = dateFormatter.string(from: sender.date)
    }
    
    @objc func onAddActivityButtonTapped() {
        let activitiesScreenDelegate = ActivitiesViewController()
        
        if let uwTodoList = addActivitiesScreen.textTodoStuff.text{
            if !uwTodoList.isEmpty {
                let newActivity = Activity(name: title!, note: uwTodoList, date: selectedDate)
                notificationCenter.post(Notification(name: NSNotification.Name("Added Activity"), object: newActivity))
                navigationController?.popViewController(animated: true)
                navigationController?.popViewController(animated: true)
            } else {
                showAlert(message: "Need to add Todo Items.", title: "Todo Info is Blank")
            }
        } else {
            showAlert(message: "Need to add Todo Items.", title: "Todo Info is Blank")
        }
    }
    
    func delegateActivityToAddScreen(name: String) {
        title = name
    }
    
    func showAlert(message: String, title: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
