//
//  MainScreenView.swift
//  TravlPlannr
//
//  Created by Victor Sunderland on 6/16/23.
//

import UIKit

import UIKit

class MainScreenView: UIView {
    var buttonLogin: UIButton!
    var buttonRegister: UIButton!
    var travlPlannrLogo: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupbuttonLogin()
        setupbuttonRegister()
        setupTravlPlannrLogo()
        
        initConstraints()
    }
    
    func setupTravlPlannrLogo() {
        travlPlannrLogo = UIImageView(image: UIImage(named: "travlPlannrLogo"))
        travlPlannrLogo.sizeToFit()
        travlPlannrLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(travlPlannrLogo)
    }
    
    
    func setupbuttonLogin(){
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.titleLabel?.font = .boldSystemFont(ofSize: 36)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
    }
    
    func setupbuttonRegister(){
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.titleLabel?.font = .boldSystemFont(ofSize: 36)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonRegister)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([

            travlPlannrLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 6),
            travlPlannrLogo.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            travlPlannrLogo.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, constant: -6),
            travlPlannrLogo.heightAnchor.constraint(equalToConstant: 200),

            buttonLogin.topAnchor.constraint(equalTo: travlPlannrLogo.bottomAnchor, constant: 64),
            buttonLogin.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            buttonRegister.topAnchor.constraint(equalTo: buttonLogin.safeAreaLayoutGuide.bottomAnchor, constant: 32),
            buttonRegister.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
