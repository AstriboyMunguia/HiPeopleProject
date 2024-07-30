//
//  LoginView.swift
//  HiPeopleProject
//
//  Created by Eduardo Geovanni Pérez Munguía on 28/07/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewViewModel()
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            VStack {
                Image("hipeoplevertical2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 40)
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 30)
                
                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
              
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 50)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 300)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 100)
         
                if viewModel.isLoggedIn {
                    Text("Cargando inicio de sesión")
                        .foregroundColor(.green)
                        .padding()
                }

            
                NavigationLink(destination: UserListView(), isActive: $viewModel.isLoggedIn) {
                    EmptyView()
                }
            }
            .padding()
            .onChange(of: viewModel.isLoggedIn) { loggedIn in
                if loggedIn {
                    isLoggedIn = true
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
