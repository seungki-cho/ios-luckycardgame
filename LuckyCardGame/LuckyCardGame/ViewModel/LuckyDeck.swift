//
//  Deck.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

final class LuckyDeck: CustomStringConvertible {
    private var deck: [LuckyCard]
    
    init() {
        deck = AnimalType.allCases.flatMap { animal in
            NumberType.allCases.map { LuckyCard(animalType: animal, numberType: $0)}
        }.shuffled()
    }
    
    var description: String { deck.map { $0.description }.joined(separator: ", ") }
}
