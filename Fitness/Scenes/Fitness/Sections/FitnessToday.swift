//
//  FitnessToday.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//

import SwiftUI

struct FitnessTodayView: View {
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        let theme = presentationData.theme
        VStack(alignment: .leading, spacing: 0) {
            Text("Today")
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 12, trailing: 20))
                .font(.title2.bold())
                .foregroundStyle(theme.label.primary)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(0..<10, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color.gray.opacity(0.5))
                            .frame(width: 200)
                    }
                }
                .padding(EdgeInsets(top: 16, leading: 20, bottom: 32, trailing: 20))
            }
            .scrollIndicators(.hidden)
            
            Divider()
                .padding(.horizontal, 20)
        }
        .frame(height: 400)
    }
}
