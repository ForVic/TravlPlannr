//
//  TravlDestinationsView.swift
//  TravlPlannr
//
//  Created by Patrick Noonan on 6/16/23.
//
import UIKit

class TravlDestinationsView: UIView {

    var tableViewDestinations: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setuptableViewDestinations()

        initConstraints()
    }

    func setuptableViewDestinations(){
        tableViewDestinations = UITableView()
        tableViewDestinations.register(TravlDestinationsTableViewCell.self, forCellReuseIdentifier: "destinations")
        tableViewDestinations.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewDestinations)
    }


    func initConstraints(){
        NSLayoutConstraint.activate([

            tableViewDestinations.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableViewDestinations.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewDestinations.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewDestinations.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8)


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
