//
//  RegisterFirebaseManager.swift
//  TravlPlannr
//
//  Created by Victor Sunderland on 6/16/23.
//

import Foundation
import UIKit
import FirebaseAuth

extension ViewController {
    func loginToAccount(){
        let signInAlert = UIAlertController(
            title: "Log In",
            message: "Please login in to continue.",
            preferredStyle: .alert)
        
        signInAlert.addTextField{ textField in
            textField.placeholder = "Enter email"
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }
        
        signInAlert.addTextField{ textField in
            textField.placeholder = "Enter password"
            textField.contentMode = .center
            textField.isSecureTextEntry = true
        }
        
        let signInAction = UIAlertAction(title: "Log In", style: .default, handler: {(_) in
            if let email = signInAlert.textFields![0].text,
               let password = signInAlert.textFields![1].text{
                self.signInToFirebase(email: email, password: password)
            }
        })
        
        signInAlert.addAction(signInAction)
        
        self.present(signInAlert, animated: true, completion: {() in
            signInAlert.view.superview?.isUserInteractionEnabled = true
            signInAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })
    }
    
    func registerAccount(){
        let registerAlert = UIAlertController(
            title: "Register",
            message: "Please register an account",
            preferredStyle: .alert)
        
        registerAlert.addTextField{ textField in
            textField.placeholder = "Enter username"
            textField.contentMode = .center
            textField.isSecureTextEntry = false
        }
        
        registerAlert.addTextField{ textField in
            textField.placeholder = "Enter email"
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }
        
        registerAlert.addTextField{ textField in
            textField.placeholder = "Enter password"
            textField.contentMode = .center
            textField.isSecureTextEntry = true
        }
        
        let registerAction = UIAlertAction(title: "Register", style: .default, handler: {(_) in
            if let username = registerAlert.textFields![0].text,
               let email = registerAlert.textFields![1].text,
               let password = registerAlert.textFields![2].text {
                self.registerUserInFirebase(username: username, email: email, password: password)
            }
        })
        
        registerAlert.addAction(registerAction)
        
        self.present(registerAlert, animated: true, completion: {() in
            registerAlert.view.superview?.isUserInteractionEnabled = true
            registerAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })
    }
}
