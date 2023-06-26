//
//  TravlDestinationsTableViewCell.swift
//  TravlPlannr
//
//  Created by Patrick Noonan on 6/16/23.
//
import UIKit

class TravlDestinationsTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var labelDestination: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupWrapperCellView()
        setupLabelDestination()

        initConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupWrapperCellView(){
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

    func setupLabelDestination(){
        labelDestination = UILabel()
        labelDestination.font = UIFont.boldSystemFont(ofSize: 20)
        labelDestination.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDestination)
    }


    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            wrapperCellView.heightAnchor.constraint(equalToConstant: 72),

            labelDestination.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            labelDestination.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 4)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
