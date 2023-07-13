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
    
    init(_ cards: [LuckyCard] = []) {
        self.deck = cards
    }
    
    var maximumSameCardCount: Int? {
        deck.reduce(into: [Int: Int]()) { (dict, card) in
            dict[card.numberType.rawValue] = (dict[card.numberType.rawValue] ?? 0) + 1
        }.values.max()
    }
    
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
