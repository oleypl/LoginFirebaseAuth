//
//  CreateUserView.swift
//  LoginFirebaseAuth
//
//  Created by Michal on 27/10/2022.
//

import SwiftUI

import SwiftUI

struct CreateUserView: View {
    @State var email = ""
    @State var password = ""
    @State var passwordConfirmation = ""
    @State var simpleAlert = false

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
                    SecureField("Confirm Password", text: $passwordConfirmation)
                        .padding()
                        .frame(width: 300)
                        .background(.white)
                        .cornerRadius(10)
                
                }
                
                Button {
                    simpleAlert = false
                    if (password == passwordConfirmation) {
                        viewManager.signUpUser(userEmail: email, userPassword: password)
                    }else
                    {
                        simpleAlert.toggle()
                    }
                } label: {
                    Text("Create")
                        .bold()
                        .padding()
                        .frame(width: 300)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                }
                .alert("Passwords is not match", isPresented: $simpleAlert) {
                }
                
                

                
                HStack{
                    Text("Are you user?")
                    Button {
                        viewManager.currentView = .loginScreen
                    } label: {
                        Text("Sign")
                            .bold()
                    }

                }
            
        }
    }
}

struct CreateUser_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
