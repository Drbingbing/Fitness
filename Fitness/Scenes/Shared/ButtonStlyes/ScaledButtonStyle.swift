//
//  ScaledButtonStyle.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//

import SwiftUI

struct ScaledButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.45 : 1)
            .animation(.bouncy, value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == ScaledButtonStyle {
    
    static var scaled: ScaledButtonStyle { ScaledButtonStyle() }
}
