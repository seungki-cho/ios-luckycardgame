//
//  Deck.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

final class Deck<FirstType: Typeable, SecondType: Typeable>: CustomStringConvertible {
    private var deck: [LuckyCard<FirstType, SecondType>]
    
    init() {
        deck = FirstType.allCases.flatMap { firstType in
            SecondType.allCases.map { LuckyCard(firstType: firstType, secondType: $0) }
        }
        .shuffled()
    }
    
    var description: String {
        deck.map { $0.description }.joined(separator: ", ")
    }
}
