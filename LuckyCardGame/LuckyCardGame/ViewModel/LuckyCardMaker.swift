//
//  LuckyCardMaker.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/13.
//

import Foundation

struct LuckyCardMaker: LuckyCardMakerProtocol {
    func makeNewDeck() -> [LuckyCard] {
        AnimalType.allCases.flatMap { animal in
            NumberType.allCases.map { LuckyCard(animalType: animal, numberType: $0)}
        }.shuffled()
    }
}
