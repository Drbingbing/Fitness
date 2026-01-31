//
//  FitnessApp.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//

import SwiftUI

@main
struct FitnessApp: App {
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            MainWindow()
                .environmentObject(appState)
        }
    }
}
