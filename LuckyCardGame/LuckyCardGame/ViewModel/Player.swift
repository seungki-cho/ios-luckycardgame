//
//  Player.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

struct Player {
    private(set) var hand: LuckyDeck = LuckyDeck()
    var cards: [LuckyCard] { hand.showCards() }
    
    mutating func changeDeck(_ deck: LuckyDeck) {
        hand = deck
    }
    
    mutating func sortDeck() {
        hand.sort()
    }
    
    func maximumSameCardCount() -> Int? {
        hand.maximumSameCardCount
    }
}
