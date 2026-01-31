//
//  Navigation+.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/31.
//

import SwiftUI

extension View {
    
    func navigate<Destination: View>(@ViewBuilder destination: () -> Destination) -> some View {
        NavigationLink(destination: destination, label: { self })
    }
    
    func navigate<Destination: View>(to destination: Destination) -> some View {
        NavigationLink(destination: { destination }, label: { self })
    }
}
