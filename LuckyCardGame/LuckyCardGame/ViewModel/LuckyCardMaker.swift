//
//  LuckyCardMaker.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/13.
//

import Foundation

struct LuckyCardMaker: LuckyCardMakerProtocol {
    func makeNewDeck(without numbers: [NumberType] = []) -> [LuckyCard] {
        AnimalType.allCases.flatMap { animal in
            NumberType.allCases.filter { !numbers.contains($0) }.map {
                LuckyCard(animalType: animal, numberType: $0)
            }
        }.shuffled()
    }
}
