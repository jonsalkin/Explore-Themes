//
//  Explore_ThemesApp.swift
//  Explore Themes
//
//  Created by Jon Salkin on 6/10/23.
//

import FirebaseCore
import SwiftUI

@main
struct Explore_ThemesApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
