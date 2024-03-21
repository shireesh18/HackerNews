//
//  News.swift
//  HackerNews
//
//  Created by Shireesh Marla on 20/03/2024.
//

import SwiftUI

struct News: View {
    
    let title: String
    let footnote: String
    let score: Int
    let commentCount: Int
    let date: Date

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(title)
                .font(.headline)
            Text(footnote)
                .font(.footnote)
                .foregroundColor(.secondary)
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                Label(score.formatted(), systemImage: "arrow.up.circle.fill")
                    .foregroundStyle(.blue)
                Label(commentCount.formatted(), systemImage: "ellipses.bubble")
                    .foregroundStyle(.orange)
                    .padding(.leading, 72)
                Label(date.formatted(date: .numeric, time: .omitted), systemImage: "calendar.circle")
                    .foregroundStyle(.brown)
                    .padding(.leading, 144)

            }
            .font(.footnote)
            .labelStyle(.titleAndIcon)
        }
    }
}

extension News {
    init(story: Story) {
        title = story.title
        score = story.score
        commentCount = story.commentCount
        footnote = (story.url.host() ?? "")
                + " - \(story.date.formatted(.relative(presentation: .numeric)))"
                + " - by \(story.author)"
        date = story.date
    }
}

#Preview {
    News(title: "This is random news", footnote: "shireesh.net - 2 days ago - by test_author", score: 4331, commentCount: 100, date: Date())
}

