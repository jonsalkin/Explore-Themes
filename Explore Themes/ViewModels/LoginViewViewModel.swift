//
//  LoginViewViewModel.swift
//  Explore Themes
//
//  Created by Jon Salkin on 6/11/23.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func login() {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        print("Called")
    }
    
    func validate() {
        
    }
    
}
