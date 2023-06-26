//
//  ActivitiesScreenView.swift
//  TravlPlannr
//
//  Created by Patrick Noonan on 6/16/23.
//
import UIKit

class ActivitiesScreenView: UIView {

    var tableViewActivities: UITableView!
    var addActivitesButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setuptableViewDestinations()
        setupAddActivitiesButton()

        initConstraints()
    }

    func setuptableViewDestinations(){
        tableViewActivities = UITableView()
        tableViewActivities.register(ActivitiesTableViewCell.self, forCellReuseIdentifier: "activities")
        tableViewActivities.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewActivities)
    }

    func setupAddActivitiesButton() {
        addActivitesButton = UIButton(type: .system)
        addActivitesButton.setTitle("Add Activity", for: .normal)
        addActivitesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        addActivitesButton.layer.cornerRadius = 10
        addActivitesButton.layer.borderColor = UIColor.lightGray.cgColor
        addActivitesButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addActivitesButton)
    }

    func initConstraints(){
        NSLayoutConstraint.activate([

            tableViewActivities.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableViewActivities.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewActivities.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            addActivitesButton.topAnchor.constraint(equalTo: tableViewActivities.bottomAnchor),
            addActivitesButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            addActivitesButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            addActivitesButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -4)


        ])
    }


    //MARK: initializing constraints...
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

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
