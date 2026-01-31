//
//  WorkoutsView.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/31.
//

import SwiftUI

struct WorkoutsView: View {
    
    @Environment(\.presentationData) var presentationData
    
    var weeks: [String] = [
        "Fri, Jan 16 - Thu, Jan 22",
        "Fri, Jan 23 - Thu, Jan 29",
        "Fri, Jan 30 - Thu, Feb 5",
        "Fri, Feb 6 - Thu, Feb 12"
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            WorkoutsTitle()
            
            ForEach(weeks.indices, id: \.self) { index in
                let range = weeks[index]
                WeekSectionView(week: index + 1, range: range)
            }
        }
        .padding(.top, 24)
    }
}

private struct WorkoutsTitle: View {
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        let theme = presentationData.theme
        HStack {
            Text("Workouts")
                .font(.largeTitle.bold())
                .foregroundStyle(theme.colors.white)
            Spacer()
            Button(action: {}) {
                Image(systemName: "calendar")
                    .glassIcon(theme.appColor)
            }
        }
        .padding(.horizontal, 20)
    }
}

private struct WeekSectionView: View {
    
    var week: Int
    var range: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            WeekHeaderView(title: "Week \(week)",dateRange: range)
            WeekPlansView()
        }
        .padding(.bottom, 24)
    }
}

private struct WeekHeaderView: View {
    
    let title: String
    let dateRange: String
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        let theme = presentationData.theme
        HStack(alignment: .bottom) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
            Text(dateRange)
        }
        .foregroundStyle(theme.colors.white)
        .padding(.horizontal, 20)
    }
}

private struct WeekPlansView: View {
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(0..<5) { _ in
                    WeekPlanView()
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 8)
        }
        .frame(height: 280)
        .scrollIndicators(.hidden)
    }
}

private struct WeekPlanView: View {
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        Image(.deadlift)
            .resizable()
            .frame(width: 200)
            .scaledToFit()
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(alignment: .bottomLeading) {
                content
            }
            .padding(4)
            .glassEffect(.clear.interactive(), in: RoundedRectangle(cornerRadius: 14))
    }
    
    @ViewBuilder
    var content: some View {
        let theme = presentationData.theme
        VStack(alignment: .leading) {
            Text("Fri, Jan 16")
                .font(.footnote)
            Text(text)
        }
        .foregroundStyle(theme.colors.white)
        .padding()
    }
    
    var text: AttributedString {
        var t = AttributedString("Deadlift 5+")
        t.font = .title2.bold()
        t.strikethroughStyle = .single
        return t
    }
}

#Preview {
    ZStack {
        Color.gray
        WorkoutsView()
    }
}

#Preview {
    WeekPlanView()
        .frame(height: 280)
}
