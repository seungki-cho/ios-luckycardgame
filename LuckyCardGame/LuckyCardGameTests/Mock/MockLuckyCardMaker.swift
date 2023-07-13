//
//  MockLuckyCardMaker.swift
//  LuckyCardGameTests
//
//  Created by cho seungki on 2023/07/13.
//

import Foundation

@testable import LuckyCardGame

class MockLuckyCardMaker: LuckyCardMakerProtocol {
    func makeNewDeck() -> [LuckyCard] {
        var deck = [LuckyCard]()
        for number in NumberType.allCases.reversed() {
            for animal in AnimalType.allCases {
                deck.append(LuckyCard(animalType: animal, numberType: number))
            }
        }
        return deck
    }
}
