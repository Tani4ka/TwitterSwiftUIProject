//
//  TwitterProjectApp.swift
//  TwitterProject
//
//  Created by Tetiana Hranchenko on 04.08.2022.
//

import SwiftUI
import Firebase

@main
struct TwitterProjectApp: App {
    
    // init viewModel in one place, and use in different files, insted initing in each file
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            // transfering viewModel to ither files
            .environmentObject(viewModel)
        }
    }
}
