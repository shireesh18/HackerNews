//
//  Story.swift
//  HackerNews
//
//  Created by Shireesh Marla on 20/03/2024.
//

import Foundation

struct Story: Identifiable, Decodable {
    let id: Int
    let commentCount: Int
    let score: Int
    let author: String
    let title: String
    let date: Date
    let url: URL

    enum CodingKeys: String, CodingKey {
        case id, score, title, url
        case commentCount = "descendants"
        case date = "time"
        case author = "by"
    }
}
