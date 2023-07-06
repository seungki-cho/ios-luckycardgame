//
//  LuckyGameService.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

struct LuckyGameService {
    private let rule: LuckyGameRule
    private let deck: LuckyDeck
    private var players: [Player]
    private var floor: [LuckyCard] = []
    
    init(rule: LuckyGameRule) {
        self.rule = rule
        self.deck = .init()
        self.players = Array(repeating: Player(), count: rule.playerCount)
    }
    
    mutating func dealCard() {
        deck.discardCard(numbers: rule.removalNumbers)
        (0..<rule.playerCount).forEach { index in
            players[index].getCards(cards: (0..<rule.playerCardCount).map{ _ in deck.drawCard() })
        }
    }
}
