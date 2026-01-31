//
//  WorkoutProgressSummary.swift
//  Fitness
//
//  Created by Bing Bing on 2026/1/31.
//

import SwiftUI

struct WorkoutProgressSummary: View {
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        let theme = presentationData.theme
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                MetricBlock(title: "Workouts Completed", value: "0/16")
                Spacer()
                MetricBlock(title: "Skipped Workouts", value: "5")
            }
            Divider()
                .foregroundStyle(theme.label.tertiary)
                .padding(.vertical, 12)
            HStack {
                MetricBlock(title: "Skipped Sets", value: "145", suffix: "sets")
                Spacer()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(.regularMaterial)
        )
        .padding(.horizontal, 20)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct MetricBlock: View {
    
    @Environment(\.presentationData) var presentationData
    
    let title: String
    let value: String
    let suffix: String?

    init(
        title: String,
        value: String,
        suffix: String? = nil
    ) {
        self.title = title
        self.value = value
        self.suffix = suffix
    }

    var body: some View {
        let theme = presentationData.theme
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .foregroundStyle(theme.label.primary)
                .font(.footnote)

            HStack(alignment: .firstTextBaseline, spacing: 6) {
                Text(value)
                    .font(.title)
                    .fontDesign(.rounded)

                if let suffix {
                    Text(suffix)
                        .font(.caption)
                        .foregroundStyle(theme.label.tertiary)
                }
            }
        }
    }
}

#Preview {
    WorkoutProgressSummary()
}
