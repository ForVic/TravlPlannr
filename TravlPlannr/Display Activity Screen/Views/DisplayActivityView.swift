//
//  DisplayActivityView.swift
//  TravlPlannrApp
//
//  Created by Patrick Noonan on 6/25/23.
//

import UIKit

class DisplayActivityView: UIView {
    
    var dateTitle:UILabel!
    var todoStuffTitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupDateTitle()
        setupTodoStuffTitle()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDateTitle(){
        dateTitle = UILabel()
        dateTitle.translatesAutoresizingMaskIntoConstraints = false
        dateTitle.font = UIFont.boldSystemFont(ofSize: 24)
        self.addSubview(dateTitle)
    }
    
    func setupTodoStuffTitle() {
        todoStuffTitle = UILabel()
        todoStuffTitle.translatesAutoresizingMaskIntoConstraints = false
        todoStuffTitle.font = UIFont.boldSystemFont(ofSize: 24)
        self.addSubview(todoStuffTitle)
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            dateTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            dateTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            todoStuffTitle.topAnchor.constraint(equalTo: dateTitle.bottomAnchor, constant: 64),
            todoStuffTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            todoStuffTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -6)
        ])
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
