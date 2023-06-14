//
//  ToDoListViewViewModel.swift
//  Explore Themes
//
//  Created by Jon Salkin on 6/11/23.
//
import FirebaseFirestore
import Foundation

// ViewModel for list of Items View
// Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
