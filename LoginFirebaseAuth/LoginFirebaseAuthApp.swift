//
//  LoginFirebaseAuthApp.swift
//  LoginFirebaseAuth
//
//  Created by Michal on 27/10/2022.
//

import SwiftUI
import Firebase

@main
struct LoginFirebaseAuthApp: App {
    @StateObject var viewManager = ViewManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewManager)
        }
    }
}
