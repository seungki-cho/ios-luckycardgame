//
//  Deck.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

final class LuckyDeck: Deckable {
    private(set) var cards: [LuckyCard] = []
    
    var description: String { cards.map { $0.description }.joined(separator: ", ") }
    
    init(_ cards: [LuckyCard] = []) {
        self.cards = cards
    }
    
    func discardCard(numbers removalNumber: [NumberType] = []) {
        cards.removeAll { card in
            !removalNumber.filter { card.isLike(number: $0) }.isEmpty
        }
    }
    #warning("고쳐")
    func drawCard() -> LuckyCard {
        deck.removeLast()
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
    
    func sort() {
        cards.sort()
    }
}
