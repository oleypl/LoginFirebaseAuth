//
//  LoginScreenView.swift
//  LoginFirebaseAuth
//
//  Created by Michal on 27/10/2022.
//

import SwiftUI

struct LoginScreenView: View {
    @State var email = ""
    @State var password = ""

    @EnvironmentObject var viewManager: ViewManager

    
    var body: some View {
        VStack{
            Image(systemName: "apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80,height: 80)
                .padding()
            
            Group {
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300)
                    .background(.white)
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300)
                    .background(.white)
                    .cornerRadius(10)
            }
            
            
            Button {
                viewManager.signInUser(userEmail: email, userPassword: password)
            } label: {
                Text("Login")
                    .bold()
                    .padding()
                    .frame(width: 300)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
            }

            
            HStack{
                Text("New user?")
                Button {
                    viewManager.currentView = .createUser
                } label: {
                    Text("Register")
                        .bold()
                }

            }
        }
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
