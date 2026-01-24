//
//  NavigationBar.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//

import SwiftUI
import Engine

struct NavigationBarView<Label: View, Trailing: View>: View {
    
    @ViewBuilder var label: () -> Label
    @ViewBuilder var trailing: () -> Trailing
    
    init(
        @ViewBuilder label: @escaping () -> Label,
        @ViewBuilder trailing: @escaping () -> Trailing
    ) {
        self.label = label
        self.trailing = trailing
    }
    
    var body: some View {
        NavigationBarBody(configuration: .init())
            .viewAlias(NavigationBarStyleConfiguration.Label.self) {
                label()
            }
            .viewAlias(NavigationBarStyleConfiguration.Trailing.self) {
                trailing()
            }
    }
}

extension NavigationBarView where Label == NavigationBarStyleConfiguration.Label, Trailing == NavigationBarStyleConfiguration.Trailing {
    
    init(configuration: NavigationBarStyleConfiguration) {
        self.init(
            label: { configuration.label },
            trailing: { configuration.trailing }
        )
    }
}

extension NavigationBarView where Trailing == EmptyView {
    
    init(@ViewBuilder label: @escaping () -> Label) {
        self.label = label
        self.trailing = { EmptyView() }
    }
    
}

private struct NavigationBarBody: ViewStyledView {
    
    var configuration: NavigationBarStyleConfiguration
    
    var body: some View {
        NavigationBarView(configuration: configuration)
    }
    
    static var defaultStyle: InlineNavigationBarStyle {
        InlineNavigationBarStyle()
    }
}

extension View {
    
    func navigationBarStyle<Style: NavigationBarStyle>(_ style: Style) -> some View {
        styledViewStyle(NavigationBarBody.self, style: style)
    }
}
