//
//  MoodHackerApp.swift
//  MoodHacker
//
//  Created by Samantha Amaro on 3/29/24.
//

import SwiftUI
import SwiftData
import Firebase
@main
struct MoodHackerApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene{
        WindowGroup{
            ContentView().environmentObject(viewModel)
        }
    }
}
