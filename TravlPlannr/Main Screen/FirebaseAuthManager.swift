//
//  FirebaseAuthManager.swift
//  TravlPlannr
//
//  Created by Victor Sunderland on 6/16/23.
//

import Foundation
import FirebaseAuth

extension ViewController {
    func signInToFirebase(email: String, password: String){
        showActivityIndicator()
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                self.hideActivityIndicator()
            }else{
                let invalidUserMsg = "Couldn't sign in with email and password given!"
                self.showAlert(message: "\(error?.localizedDescription ?? invalidUserMsg)", title: "Error!")
                self.hideActivityIndicator()
            }
        })
    }
    
    func registerUserInFirebase(username:String, email:String, password:String) {
        showActivityIndicator()
        Auth.auth().createUser(withEmail: email.lowercased(), password: password, completion: {result, error in
            if error == nil{
                self.setNameOfTheUserInFirebaseAuth(username: username, email: email.lowercased())
                self.hideActivityIndicator()
            }else{
                let invalidUserMsg = "Couldn't register user!"
                self.showAlert(message: "\(error?.localizedDescription ?? invalidUserMsg)", title: "Error")
                self.hideActivityIndicator()
            }
        })
    }
    
    func setNameOfTheUserInFirebaseAuth(username: String, email: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = username
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                self.addToUserCollection(username: username, email: email)
                self.hideActivityIndicator()
            }else{
                let invalidUserMsg = "Couldn't register user!"
                self.showAlert(message: "\(error?.localizedDescription ?? invalidUserMsg)", title: "Error!")
                self.hideActivityIndicator()
            }
        })
    }
    
    func addToUserCollection(username: String, email: String) {
        self.database
            .collection(Configs.userCollectionName)
            .addDocument(data: [
                Configs.userCollectionUsernameField: username,
                Configs.userCollectionEmailField: email
            ])
    }
}
