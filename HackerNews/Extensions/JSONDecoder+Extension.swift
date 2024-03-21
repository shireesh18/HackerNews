//
//  JSONDecoder+Extension.swift
//  HackerNews
//
//  Created by Shireesh Marla on 21/03/2024.
//

import Foundation

extension JSONDecoder {
    static var apiDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }
}
