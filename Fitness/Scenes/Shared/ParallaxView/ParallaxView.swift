//
//  ParallaxView.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/31.
//

import SwiftUI

struct ParallaxView<Content: View>: View {
    
    @ViewBuilder var content: () -> Content
    
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        let height: CGFloat = 350
        GeometryReader { geo in
            let minY = geo.frame(in: .named("scroll")).minY
            let stretch = max(0, minY)
            content()
                .offset(y: 40)
                .frame(
                    width: geo.size.width,
                    height: height + max(0, minY)
                )
                .scaleEffect(
                    minY > 0
                    ? 1 + (stretch / height) * 0.35
                    : 1,
                    anchor: .center
                )
                .offset(
                    y: minY > 0
                    ? -stretch
                    : -minY * 0.45
                )
        }
        .frame(height: height)
    }
}
