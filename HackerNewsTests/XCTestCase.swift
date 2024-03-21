//
//  XCTestCase.swift
//  HackerNewsTests
//
//  Created by Shireesh Marla on 21/03/2024.
//

import XCTest
@testable import HackerNews

extension XCTestCase {
    func openJsonFile<ModelType: Decodable>(
        named name: String,
        file: StaticString = #file,
        line: UInt = #line) throws -> ModelType {
        let url = try XCTUnwrap(
            Bundle.main.url(forResource: name, withExtension: "json"),
            file: file,
            line: line)
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
        return try decoder.decode(ModelType.self, from: data)
    }

}
