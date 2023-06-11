//
//  LoginView.swift
//  Explore Themes
//
//  Created by Jon Salkin on 6/11/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                
                // Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Login",
                        background: .blue
                    ) {
                        viewModel.login()
                    }
                    
                }
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("New around here?")
                        .padding(.bottom, 5)
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
