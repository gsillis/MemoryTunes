//
//  SearchResult.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 01/05/24.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let artworkUrl100: String
}
