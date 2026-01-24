//
//  FitnessListView.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//

import SwiftUI

struct FitnessListView: View {
    
    @EnvironmentObject var appState: AppState
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    NavigationBarView(
                        label: { titleView },
                        trailing: { gearButton }
                    )
                    .navigationBarStyle(.largeTitle)
                    FitnessTodayView()
                    FitnessCurrentView()
                    FitnessWeekView()
                }
            }
            .toolbarVisibility(.hidden, for: .automatic)
            .environment(\.presentationData, presentationData)
        }
    }
    
    @ViewBuilder
    var titleView: some View {
        let theme = presentationData.theme
        Text("Home")
            .foregroundStyle(theme.label.primary)
    }
    
    @ViewBuilder
    var gearButton: some View {
        Button(action: {}) {
            Image(systemName: "gear")
                .foregroundStyle(presentationData.theme.appColor)
                .padding(8)
                .glassEffect()
        }
        .buttonStyle(.scaled)
    }
}
