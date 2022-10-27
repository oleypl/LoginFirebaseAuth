//
//  LoggedView.swift
//  LoginFirebaseAuth
//
//  Created by Michal on 27/10/2022.
//

import SwiftUI

struct LoggedView: View {
    @EnvironmentObject var viewManager: ViewManager

    var body: some View {
        VStack {
            Text("Status: Logged")
                .padding()
            Button {
                viewManager.signOutUser()
            } label: {
                Text("Push here to logout")
                    .frame(width: 250,height: 80)
                    .background(Color.red)
            }
        }
    }
}

struct LoggedView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedView()
    }
}
