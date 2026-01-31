//
//  PresentationData.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//

import SwiftUI
import Foundation

struct PresentationData: Equatable {
    
    let theme: PresentationTheme
    
    init(theme: PresentationTheme = .lightMode) {
        self.theme = theme
    }
    
    func withUpdate(isDark: Bool) -> PresentationData {
        PresentationData(theme: isDark ? .darkMode : .lightMode)
    }
}

struct PresentationTheme: Equatable {
    
    let appColor: Color
    let label: PresentationThemeLabel
    let colors: PresentationThemeColors
    
    init(appColor: Color, label: PresentationThemeLabel, colors: PresentationThemeColors) {
        self.label = label
        self.appColor = appColor
        self.colors = colors
    }
    
    static var darkMode: PresentationTheme {
        PresentationTheme(
            appColor: Color(red: 33/255, green: 150/255, blue: 243/255),
            label: .darkMode,
            colors: .darkMode
        )
    }
    
    static var lightMode: PresentationTheme {
        PresentationTheme(
            appColor: Color(red: 51/255, green: 102/255, blue: 153/255),
            label: .lightMode,
            colors: .lightMode
        )
    }
}

struct PresentationThemeLabel: Equatable {
    
    let primary: Color
    let secondary: Color
    let tertiary: Color
    
    init(primary: Color, secondary: Color, tertiary: Color) {
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
    }
    
    static var darkMode: PresentationThemeLabel {
        PresentationThemeLabel(
            primary: Color(red: 242/242, green: 242/242, blue: 247/247),
            secondary: Color(red: 209/242, green: 209/242, blue: 214/247),
            tertiary: Color(red: 142/242, green: 142/242, blue: 147/247)
        )
    }
    
    static var lightMode: PresentationThemeLabel {
        PresentationThemeLabel(
            primary: Color(red: 28/242, green: 28/242, blue: 30/247),
            secondary: Color(red: 58/242, green: 58/242, blue: 60/247),
            tertiary: Color(red: 142/242, green: 142/242, blue: 147/247)
        )
    }
}

struct PresentationThemeColors: Equatable {
    
    let white: Color
    
    init(white: Color) {
        self.white = white
    }
    
    static var darkMode: PresentationThemeColors {
        PresentationThemeColors(white: Color.white)
    }
    
    static var lightMode: PresentationThemeColors {
        PresentationThemeColors(white: Color.white)
    }
}

struct PresentationDataKey: EnvironmentKey {
    static var defaultValue: PresentationData = PresentationData()
}

extension EnvironmentValues {
    
    var presentationData: PresentationData {
        get { self[PresentationDataKey.self] }
        set { self[PresentationDataKey.self] = newValue }
    }
}
