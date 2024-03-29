//
//  NewsViewModel.swift
//  HackerNews
//
//  Created by Shireesh Marla on 20/03/2024.
//

import Foundation


@Observable
class NewsViewModel{

    var stories: [Story] = []

    func fetchTopStories() async throws {
        let url = URL(string: AppConstants.base_url+AppConstants._topStoriesEndpoint)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let ids = try JSONDecoder.apiDecoder.decode([Int].self, from: data)
        stories = try await withThrowingTaskGroup(of: Story.self) { group in
            for id in ids.prefix(AppConstants.storyLimit) {
                group.addTask {
                    return try await self.fetchStory(withID: id)
                }
            }
            var stories: [Story] = []
            for try await story in group {
                stories.append(story)
            }
            return stories
        }
    }

    private func fetchStory(withID id: Int) async throws -> Story {
        let url = URL(string: AppConstants.base_url+AppConstants._storyEndpoint+"\(id).json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder.apiDecoder.decode(Story.self, from: data)
    }

}
