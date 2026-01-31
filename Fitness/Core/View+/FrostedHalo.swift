//
//  FrostedHalo.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/31.
//

import SwiftUI

struct FrostedHalo: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background {
                ZStack {
                    Image("dark_glow_bg")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                }
            }
    }
}

extension View {
    
    func frostedHalo() -> some View {
        modifier(FrostedHalo())
    }
}
