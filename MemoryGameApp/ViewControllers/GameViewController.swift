//
//  ViewController.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 29/04/24.
//

import UIKit
import Foundation
import Combine

final class GameViewController: UIViewController {
    var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        let urlString = "https://itunes.apple.com/search?term=pop&entety=music"

        ItunesService(url: urlString).searchFor()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    // Handle error
                    let errorMessage = error.localizedDescription
                    print(errorMessage)
                }
            }, receiveValue: { urls in
                // Update image URLs
                let  imageUrls = urls
                print(imageUrls)
            })
            .store(in: &cancellables)
    }
}

