//
//  ItunesService.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 30/04/24.
//

import Combine
import Foundation

protocol ItunesServicing {
    func searchFor() -> AnyPublisher<[String], Error>
}

final class ItunesService: ItunesServicing {
    private let url: String
    private let urlSession: URLSession
    
    init(url: String, urlSession: URLSession = URLSession.shared) {
        self.url = url
        self.urlSession = urlSession
    }
    
    func searchFor() -> AnyPublisher<[String], Error> {
        guard let url = URL(string: url) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return urlSession.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .map { $0.results.map { $0.artworkUrl100 } }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
