//
//  HackerNewsTests.swift
//  HackerNewsTests
//
//  Created by Shireesh Marla on 20/03/2024.
//

import XCTest
@testable import HackerNews

final class HackerNewsTests: XCTestCase {

    func testStoryDecoding() throws {
        let story: Story = try openJsonFile(named: "Story")!
        try verifyStandardFields(in: story)
    }


}

private extension HackerNewsTests {
    func verifyStandardFields(in story: Story,
                              file: StaticString = #file,
                              line: UInt = #line) throws {
        XCTAssertEqual(story.id, 39737281)
        XCTAssertEqual(story.author, "pierre")
        XCTAssertEqual(story.commentCount, 417)
        XCTAssertEqual(story.score, 1156)
        XCTAssertEqual(story.date, Date(timeIntervalSince1970: 1710704017))
        XCTAssertEqual(story.title, "Grok")
        XCTAssertEqual(story.url.absoluteString, "https://github.com/xai-org/grok")
    }
}


