//
//  ContentView.swift
//  LoginFirebaseAuth
//
//  Created by Michal on 27/10/2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var viewManager: ViewManager

    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            
            switch viewManager.currentView {
            case .logged:
                LoggedView()

            case .createUser:
                CreateUserView()

            case .loginScreen:
                LoginScreenView()
                

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewManager())
    }
}
