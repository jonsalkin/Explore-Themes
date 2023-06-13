//
//  ToDoListViewViewModel.swift
//  Explore Themes
//
//  Created by Jon Salkin on 6/11/23.
//

import Foundation

// ViewModel for list of Items View
// Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    init() {}
    
    func delete(id: String) {
        
    }
}
