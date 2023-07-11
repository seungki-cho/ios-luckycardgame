//
//  LuckyGameService.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

class LuckyGameService {
    private var rule: LuckyGameRule
    private var deck: LuckyDeck = .init()
    
    private var mainPlayer: Player = .init()
    private var players: [Player] = []
    private var floor: Player = .init()
    
    init(rule: LuckyGameRule) {
        self.rule = rule
    }
    
    private func dealCard() {
        deck.discardCard(numbers: rule.removalNumbers)
        deck.appendCards( AnimalType.allCases.flatMap { animal in
            NumberType.allCases.map { LuckyCard(animalType: animal, numberType: $0)}
        }.shuffled())
        
        mainPlayer.getCards(cards: (0..<rule.playerCardCount).map { _ in
            var card = deck.drawCard()
            card.isFlipped = true
            return card
        })
        (0..<rule.supportingPlayerCount).forEach { index in
            players[index].getCards(cards: (0..<rule.playerCardCount).map { _ in deck.drawCard() })
        }
        floor.getCards(cards: (0..<rule.floorCardCount).map { _ in deck.drawCard()} )
    }
    
    func changeRule(_ newRule: LuckyGameRule) {
        rule = newRule
        deck = .init()
        mainPlayer = .init()
        players = (0..<rule.supportingPlayerCount).map { _ in Player() }
        floor = .init()
        
        dealCard()
    }
    }
}
