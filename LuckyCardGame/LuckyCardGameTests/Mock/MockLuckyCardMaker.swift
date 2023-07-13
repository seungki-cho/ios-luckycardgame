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
    
    static var pickThreeCardTestDeck: [LuckyCard] {
        let stringArray = ["🐱11", "🐶09", "🐮02", "🐱09", "🐮10", "🐶03", "🐱04", "🐱07",
                           "🐮11", "🐶02", "🐶05", "🐶07", "🐮03", "🐮04", "🐮09", "🐶01",
                           "🐶11", "🐱08", "🐱05", "🐶04", "🐮08", "🐶08", "🐱06", "🐮01",
                           "🐶10", "🐶06", "🐱02", "🐶12", "🐱12", "🐮06", "🐱03", "🐱01", "🐮07", "🐮05", "🐮12"]
        
        let deck = stringArray.compactMap { string in
            var string = string
            let animal = AnimalType(rawValue: String(string.removeFirst()))
            let number = NumberType(rawValue: Int(String(string))!)
            return LuckyCard(animalType: animal!, numberType: number!)
        }
        return deck
    }
    
    init(cards: [LuckyCard] = randomDeck) {
        self.cards = cards
    }
    
    func makeNewDeck(without numbers: [LuckyCardGame.NumberType] = []) -> [LuckyCardGame.LuckyCard] {
        cards.filter { card in
            numbers.allSatisfy { !card.isLike(number: $0) }
        }
                      
    }
}
