//
//  FitnessWeek.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//

import SwiftUI

struct FitnessWeekView: View {
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        let theme = presentationData.theme
        VStack(alignment: .leading, spacing: 0) {
            Text("This week")
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 12, trailing: 20))
                .font(.title2.weight(.semibold))
                .foregroundStyle(theme.label.primary)
            FitnessWeekPlansView()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct FitnessWeekPlansView: View {
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            WeekPlan()
            WeekPlan()
            WeekPlan()
        }
        .padding(.horizontal, 20)
    }
    
    struct WeekPlan: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.5))
                .frame(height: 64)
        }
    }
}

