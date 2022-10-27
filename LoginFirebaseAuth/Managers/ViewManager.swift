//
//  ViewManager.swift
//  LoginFirebaseAuth
//
//  Created by Michal on 27/10/2022.
//

import Foundation
import SwiftUI
import Firebase

class ViewManager: ObservableObject {
    
    @Published var currentView: LoginStatus = .loginScreen

    
    enum LoginStatus {
      case logged
      case loginScreen
      case createUser
    }
    
    func signUpUser(userEmail: String, userPassword: String) {
       
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { [self] authResult, error in
            guard error == nil else {
                print(error)
                return
            }
            switch authResult {
            case .none:
                print("Could not create account.")
            case .some(_):
                print("User created")
                currentView = .loginScreen
            }
        }
    }
    
    func signInUser(userEmail: String, userPassword: String) {

        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { authResult, error in
            
            guard error == nil else {
                print(error)
                return
            }
            switch authResult {
            case .none:
                print("Could not sign in user.")
            case .some(_):
                print("User signed in")
                self.currentView = .logged
            }
            
        }
    }
    
    func signOutUser() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        withAnimation {
            currentView = .loginScreen
        }
    }
    
}
