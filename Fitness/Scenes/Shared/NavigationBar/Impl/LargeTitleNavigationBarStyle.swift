//
//  LargeTitleNavigationBarStyle.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//
import SwiftUI
import Engine

struct LargeTitleNavigationBarStyle: NavigationBarStyle {
    
    func makeBody(configuration: NavigationBarStyleConfiguration) -> some View {
        HStack(spacing: 4) {
            configuration.label
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            configuration.trailing
                .font(.title2)
        }
        .padding(.horizontal, 20)
    }
}

extension NavigationBarStyle where Self == LargeTitleNavigationBarStyle {
    
    static var largeTitle: LargeTitleNavigationBarStyle { LargeTitleNavigationBarStyle() }
}
