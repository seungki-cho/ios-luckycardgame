//
//  Player.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

struct Player {
    private var hand: LuckyDeck = LuckyDeck()
    
    mutating func getCards(cards: [LuckyCard]) {
        hand.appendCards(cards)
    }
    
    func showCards() -> [LuckyCard] {
        hand.showCards()
    }
}
