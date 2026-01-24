//
//  MainWindow.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//

import SwiftUI

struct MainWindow: View {
    
    @EnvironmentObject var appState: AppState
    @Environment(\.colorScheme) var colorScheme
    @State private var presentationData = PresentationData()
    
    var body: some View {
        TabView {
            FitnessListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ScrollView {}
                .tabItem {
                    Label("Home", systemImage: "calendar")
                }
            
            ScrollView {}
                .tabItem {
                    Label("Home", systemImage: "books.vertical.fill")
                }
        }
        .environmentObject(appState)
        .tint(presentationData.theme.appColor)
        .onChange(of: colorScheme) { oldValue, newValue in
            presentationData = presentationData.withUpdate(isDark: newValue == .dark)
        }
        .environment(\.presentationData, presentationData)
    }
}

#Preview {
    MainWindow()
        .environmentObject(AppState())
}
