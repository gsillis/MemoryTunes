//
//  MemoryGameLogic.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 03/05/24.
//

import Foundation
import GameplayKit

private struct MemoryGameConstants {
    static let numberOfUniqueCards = 8
}

func generateNewCards(with imageUrl: [String]) -> [MemoryCard] {
    var memoryCard = imageUrl[0 ..< MemoryGameConstants.numberOfUniqueCards].map { image in
        MemoryCard(imageUrl: image, isFlipped: false, isAlreadyGuessed: false)
    }
    
    memoryCard.append(contentsOf: memoryCard)
    
    guard let cards =  GKRandomSource.sharedRandom().arrayByShufflingObjects(in: memoryCard) as? [MemoryCard] else { return [MemoryCard]() }
    return cards
}

func flipCard(index: Int, cards: [MemoryCard]) -> [MemoryCard] {
    var changedCards = cards
    
    changedCards[index].isFlipped = true
    
    let alreadyFlippedInGame = changedCards.filter { card in
        !card.isAlreadyGuessed && card.isFlipped
    }
    
    switch alreadyFlippedInGame.count {
    case 2:
        let firstCardUrl = alreadyFlippedInGame[0].imageUrl
        let secondCardUrl = alreadyFlippedInGame[1].imageUrl
        
        let playerGuessedRight = firstCardUrl == secondCardUrl
        
        if playerGuessedRight {
            changedCards = checkGuessedCards(for: firstCardUrl, in: changedCards)
        }
    case 3:
        changedCards = flipBackCards(changedCards, exceptIndex: index)
    default: 
        break
    }
    return changedCards
}

func checkGuessedCards(for imageUrl: String, in cards: [MemoryCard]) -> [MemoryCard] {
    var changedCards = cards
    
    for index in 0 ..< cards.count {
        if cards[index].imageUrl == imageUrl {
            changedCards[index].isAlreadyGuessed = true
        }
    }
    return changedCards
}

func flipBackCards(_ cards: [MemoryCard], exceptIndex: Int) -> [MemoryCard] {
    var changedCards = cards
    
    for index in 0 ..< cards.count {
        if index != cards.count {
            changedCards[index].isFlipped = false
        }
    }
    return changedCards
}

func hasFinishedGame(cards: [MemoryCard]) -> Bool {
    for item in cards {
        if !item.isAlreadyGuessed {
            return false
        }
    }
    return true
}
