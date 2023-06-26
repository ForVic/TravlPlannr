//
//  AddActivitiesView.swift
//  TravlPlannrApp
//
//  Created by Patrick Noonan on 6/25/23.
//

import UIKit

class AddActivitiesView: UIView {
    
    var datePicker: UIDatePicker!
    var textTodoStuff: UITextField!
    var buttonAddActivity: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupDatePicker()
        setupTextTodoStuff()
        setupButtonAddActivity()
        
        initConstraints()
    }
    
    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.frame = CGRect(x: 10, y: 50, width: self.frame.width, height: 200)
        datePicker.timeZone = NSTimeZone.local
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePicker)
        
    }
    
    func setupTextTodoStuff() {
        textTodoStuff = UITextField()
        textTodoStuff.placeholder = "Todo List..."
        textTodoStuff.layer.cornerRadius = 10
        textTodoStuff.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textTodoStuff)
    }
    
    func setupButtonAddActivity() {
        buttonAddActivity = UIButton(type: .system)
        buttonAddActivity.setTitle("Add Activity", for: .normal)
        buttonAddActivity.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        buttonAddActivity.layer.cornerRadius = 10
        buttonAddActivity.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAddActivity)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            datePicker.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            textTodoStuff.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 32),
            textTodoStuff.leadingAnchor.constraint(equalTo: datePicker.leadingAnchor),
            textTodoStuff.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -6),
            
            buttonAddActivity.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            buttonAddActivity.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
