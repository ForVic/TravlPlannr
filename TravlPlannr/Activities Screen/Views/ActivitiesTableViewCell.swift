//
//  ActivitesTableViewCell.swift
//  App14
//
//  Created by Patrick Noonan on 6/24/23.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var labelTitle: UILabel!
    var labelDate: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellVIew()
        setupLabelTitle()
        setupLabelDate()
        
        initConstraints()
    }
    
    func setupWrapperCellVIew(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    func setupLabelTitle(){
        labelTitle = UILabel()
        labelTitle.font = UIFont.boldSystemFont(ofSize: 20)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTitle)
    }
    
    func setupLabelDate() {
        labelDate = UILabel()
        labelDate.font = UIFont.boldSystemFont(ofSize: 20)
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDate)
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelDate.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            labelDate.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -6),
            
            labelTitle.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            labelTitle.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelTitle.heightAnchor.constraint(equalToConstant: 20),
            labelTitle.trailingAnchor.constraint(lessThanOrEqualTo: labelDate.leadingAnchor, constant: -6),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
