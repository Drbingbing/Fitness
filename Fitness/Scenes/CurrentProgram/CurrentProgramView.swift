//
//  CurrentProgramView.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/31.
//

import SwiftUI

struct CurrentProgramView: View {
    
    @Environment(\.presentationData) var presentationData
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        let theme = presentationData.theme
        ScrollView {
            ParallaxView {
                Image("531_background")
                    .resizable()
                    .scaledToFill()
            }
            VStack(spacing: 4) {
                Text("5/3/1")
                    .font(.system(size: 58, weight: .bold, design: .rounded))
                    .foregroundStyle(theme.colors.white)
                WorkoutProgressSummary()
                WorkoutsView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                }
                .foregroundStyle(theme.label.primary)
            }
        }
        .background {
            Color.black.ignoresSafeArea()
        }
    }
}

#Preview {
    NavigationStack {
        CurrentProgramView()
            .toolbarVisibility(.hidden, for: .navigationBar)
    }
}
