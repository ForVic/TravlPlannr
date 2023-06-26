//
//  ViewController.swift
//  TravlPlannr
//
//  Created by Victor Sunderland on 6/8/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    
    let database = Firestore.firestore()
    
    let mainScreenView = MainScreenView()
    
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = mainScreenView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScreenView.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        mainScreenView.buttonLogin.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: nil, action: nil)
        title = "TravlPlannr"
    }
    
    @objc func onRegisterTapped(){
        registerAccount()
    }
    @objc func onLoginTapped(){
        loginToAccount()
    }
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
    }
    
    func showAlert(message: String, title: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func pushTravelDestinationScreen() {
        let travlDestinationsViewController = TravlDestinationsViewController()
        travlDestinationsViewController.currentUser = Auth.auth().currentUser
        navigationController?.pushViewController(travlDestinationsViewController, animated: true)
    }
}
