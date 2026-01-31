//
//  Buttons+.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/31.
//

import SwiftUI

extension View {
    func glassIcon<Style: ShapeStyle>(_ style: Style, in s: some Shape = Circle()) -> some View {
        self
            .foregroundStyle(style)
            .padding(12)
            .glassEffect(.regular.interactive(), in: s)
    }
}
