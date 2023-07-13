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
    
    init(cards: LuckyDeck = randomDeck) {
        self.cards = cards
    }
    
    func makeNewDeck(without numbers: [LuckyCardGame.NumberType] = []) -> [LuckyCardGame.LuckyCard] {
        cards.filter { card in
            numbers.allSatisfy { !card.isLike(number: $0) }
        }
                      
    }
}
