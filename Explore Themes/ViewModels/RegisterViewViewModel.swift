//
//  RegisterViewViewModel.swift
//  Explore Themes
//
//  Created by Jon Salkin on 6/11/23.
//
/*
 This code snippet defines a Swift class called `RegisterViewViewModel` that serves as a view model for a user registration view. It utilizes the `ObservableObject` protocol to make its properties observable and automatically update the views whenever they change.

  The `RegisterViewViewModel` class is declared. It conforms to the `ObservableObject` protocol.
  The `@Published` attribute is applied to three properties: `name`, `email`, and `password`. This attribute ensures that any changes to these properties will automatically trigger updates to the views observing them. These properties are initialized with empty strings.
  The `init()` method is provided but doesn't have any specific implementation.
  The `register()` method is defined. It is responsible for registering a new user using Firebase Authentication.
  Inside the `register()` method, the `validate()` function is called to check if the provided user registration information is valid. If the validation fails, the method returns without further action.
  If the validation passes, `Auth.auth().createUser(withEmail:password:completion:)` is called to create a new user with the provided email and password. The completion closure is used to handle the result and potential errors.
  Inside the completion closure, the result's `user.uid` is used to retrieve the newly created user's unique identifier (`userId`). If `userId` is successfully obtained, the `insertUserRecord(id:)` method is called.
  The `insertUserRecord(id:)` method creates a new `User` object with the provided `id`, `name`, `email`, and the current timestamp using the `Date().timeIntervalSince1970` method.
  The Firestore database instance is obtained using `Firestore.firestore()`.
  The `newUser.asDictionary()` method is called to convert the `newUser` object into a dictionary, which can be stored in Firestore.
  Finally, the dictionary representation of the user is set as the data for the document with the `id` in the "users" collection using the `setData(_:)` method.

 Additionally, the class includes a private `validate()` method that performs various checks to ensure the validity of the user registration input data. It checks that the `name`, `email`, and `password` fields are not empty and that the `email` has a valid format and the `password` has a minimum length of 6 characters.

 In summary, this class provides a `RegisterViewViewModel` that handles user registration by validating the input data, creating a new user using Firebase Authentication, and storing the user's information in Firestore.
 */

import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
        
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
    
}
