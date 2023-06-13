//
//  MainViewViewModel.swift
//  Explore Themes
//
//  Created by Jon Salkin on 6/11/23.
//
import FirebaseAuth
import Foundation

// The MainViewViewModel class is declared. It inherits from ObservableObject,
// indicating that its properties can be observed for changes.

// Checking the state to determine if the user is already logged in.
// This allows observing the authentication state and provides the currentUserId property
// to access the UID of the currently logged-in user.
// It also provides the isSignedIn property to determine if a user is signed in
// based on the presence of a current user in Firebase Authentication.

// The @Published attribute is applied to the currentUserId property, meaning
// any changes to this property will automatically trigger updates to the views observing it.
// currentUserId is initialized with an empty string.

// The handler property is declared as an AuthStateDidChangeListenerHandle,
// which is a listener handle for the Firebase Authentication state changes.

// In the init() method, the code sets up a listener for authentication state changes using
// Auth.auth().addStateDidChangeListener. This method takes a closure as a parameter,
// which will be called whenever the authentication state changes.
// The [weak self] capture list is used to avoid a strong reference cycle.

// Inside the closure, self?.currentUserId is updated asynchronously on the main queue.
// It sets currentUserId to the UID of the current user if user is not nil.
// Otherwise, it sets currentUserId to an empty string.

// The isSignedIn property is a computed property that returns a Bool.
// It checks if Auth.auth().currentUser is not nil,
// indicating that a user is currently signed in.

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
     
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
