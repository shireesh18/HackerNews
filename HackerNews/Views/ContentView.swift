//
//  ContentView.swift
//  HackerNews
//
//  Created by Shireesh Marla on 20/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = NewsViewModel()

    var body: some View {
        List(viewModel.stories) { story in
            News(story: story)
            .alignmentGuide(.listRowSeparatorLeading){d in
                    d[.leading]
            }
        }
        .listStyle(.plain)
        .navigationTitle("News")
        .task {
            try? await viewModel.fetchTopStories()
        }
        .toolbar {
            Button("Reload") {
                Task { try? await viewModel.fetchTopStories() }
            }
        }
        .refreshable {
            Task {try? await viewModel.fetchTopStories()}
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
