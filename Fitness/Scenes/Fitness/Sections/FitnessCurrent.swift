//
//  FitnessCurrent.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/24.
//

import SwiftUI

struct FitnessCurrentView: View {
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            FitnessCurrentPreview()
                .navigate(to: CurrentProgramView())
            FitnessCurrentSummaryView()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 32)
    }
}

private struct FitnessCurrentPreview: View {
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        let theme = presentationData.theme
        HStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.gray.opacity(0.5))
                .frame(width: 130)
            VStack(alignment: .leading, spacing: 0) {
                Text("Current Program")
                    .foregroundStyle(theme.label.tertiary)
                HStack {
                    Text("5/3/1")
                        .font(.title.bold())
                        .foregroundStyle(theme.label.primary)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(theme.label.tertiary)
                        .font(.body.bold())
                }
            }
            .padding(.vertical, 16)
        }
        .padding(.horizontal, 20)
    }
}

private struct FitnessCurrentSummaryView: View {
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        let theme = presentationData.theme
        HStack {
            FitnessCurrentStatusItemView(title: "Cycle #", content: "1", role: .accent)
            FitnessCurrentStatusItemView(title: "Week", content: "2/4")
            FitnessCurrentStatusItemView(title: "Streak", content: "‒")
            FitnessCurrentStatusItemView(title: "Phase", content: "3+")
        }
        .frame(maxWidth: .infinity, idealHeight: 80)
        .padding(.vertical, 4)
        .padding(.horizontal, 20)
        .background {
            RoundedRectangle(cornerRadius: 18)
                .fill(theme.label.tertiary.opacity(0.2))
        }
        .padding(.horizontal, 20)
    }
}


private struct FitnessCurrentStatusItemView: View {
    
    enum StatusItemRole {
        case primary
        case accent
    }
    
    @Environment(\.presentationData) var presentationData
    
    var title: String
    var content: String
    var role: StatusItemRole = .primary
    
    var body: some View {
        let theme = presentationData.theme
        VStack(spacing: 8) {
            Text(title)
                .font(.body)
                .foregroundStyle(role == .accent ? theme.appColor : theme.label.primary)
            Text(content)
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .foregroundStyle(theme.label.primary)
        }
        .frame(maxWidth: .infinity)
    }
}
