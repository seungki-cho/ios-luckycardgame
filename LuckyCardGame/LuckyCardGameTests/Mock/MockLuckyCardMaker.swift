//
//  MockLuckyCardMaker.swift
//  LuckyCardGameTests
//
//  Created by cho seungki on 2023/07/13.
//

import Foundation

@testable import LuckyCardGame

class MockLuckyCardMaker: LuckyCardMakerProtocol {
    let cards: [LuckyCard]
    static var randomDeck: [LuckyCard] {
        var deck = [LuckyCard]()
        for number in NumberType.allCases.reversed() {
            for animal in AnimalType.allCases {
                deck.append(LuckyCard(animalType: animal, numberType: number))
            }
        }
        return deck
    }
    
    init(cards: [LuckyCard] = randomDeck) {
        self.cards = cards
    }
    
    func makeNewDeck() -> [LuckyCard] {
        return cards
    }
}
