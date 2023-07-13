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
    
    func discardCard(numbers removalNumber: [NumberType] = []) {
        deck.removeAll { card in
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
        deck.sort()
    }
}
