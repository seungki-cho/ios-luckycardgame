//
//  LuckyCardMaker.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/13.
//

import Foundation

struct LuckyCardMaker: LuckyCardMakerProtocol {
    func makeNewDeck() -> LuckyDeck {
        let allCards = AnimalType.allCases.flatMap { animal in
            NumberType.allCases.map { LuckyCard(animalType: animal, numberType: $0)}
        }.shuffled()
        let newDeck = LuckyDeck()
        newDeck.appendCards(allCards)
        
        return newDeck
    }
}
