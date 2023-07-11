//
//  Deck.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

final class LuckyDeck: CustomStringConvertible {
    private var deck: [LuckyCard] = []
    
    var description: String { deck.map { $0.description }.joined(separator: ", ") }
    
    func discardCard(animals removalAnimal: [AnimalType] = [],
                     numbers removalNumber: [NumberType] = []
    ) {
        deck.removeAll { removalAnimal.contains($0.animalType) || removalNumber.contains($0.numberType) }
    }
    
    func drawCard() -> LuckyCard {
        deck.removeLast()
    }
    
    func appendCard(_ card: LuckyCard) {
        deck.append(card)
    }
    
    func appendCards(_ cards: [LuckyCard]) {
        deck.append(contentsOf: cards)
    }
    
    func removeCards(where shouldBeRemoved: (LuckyCard) -> Bool) {
        deck.removeAll { shouldBeRemoved($0) }
    }
    
    func showCards() -> [LuckyCard] {
        deck
    }
}
