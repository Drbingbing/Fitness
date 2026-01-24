//
//  NavigationBarStyles.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//
import SwiftUI
import Engine

struct NavigationBarStyleConfiguration {
    
    struct Label: ViewAlias {}
    struct Trailing: ViewAlias {}
    
    var label: Label { Label() }
    var trailing: Trailing { Trailing() }
}

protocol NavigationBarStyle: ViewStyle where Configuration == NavigationBarStyleConfiguration {}
