//
//  FloorDeck.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/14.
//

import Foundation

struct FloorDeck: Deckable {
    private(set) var cards: [LuckyCard]
    
    var description: String { cards.description }
    
    init(_ cards: [LuckyCard] = []) {
        self.cards = cards
    }
    
    func showCard(at index: Int) -> LuckyCard? {
        guard (0..<cards.count) ~= index else { return nil }
        return cards[index]
    }
    
    mutating func sort() {
        cards.sort()
    }
}
