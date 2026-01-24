//
//  InlineNavigationBarStyle.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//
import SwiftUI
import Engine

struct InlineNavigationBarStyle: NavigationBarStyle {
    
    func makeBody(configuration: NavigationBarStyleConfiguration) -> some View {
        configuration.label
            .font(.body)
    }
}

extension NavigationBarStyle where Self == InlineNavigationBarStyle {
    
    static var inline: InlineNavigationBarStyle { InlineNavigationBarStyle() }
}
