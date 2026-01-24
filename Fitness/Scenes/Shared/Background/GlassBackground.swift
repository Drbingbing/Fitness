//
//  GlassBackground.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//

import SwiftUI

struct GlassBackground: View {
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        ZStack {
            // Base gradient
            LinearGradient(
                colors: [
                    Color.white,
                    Color.cyan.opacity(0.05)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Color(red: 1.0, green: 0.98, blue: 0.96)
                .opacity(0.15)
                .blendMode(.overlay)

            // Cool tint
            presentationData.theme.appColor.opacity(0.06)
                .blendMode(.overlay)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GlassBackground()
}
