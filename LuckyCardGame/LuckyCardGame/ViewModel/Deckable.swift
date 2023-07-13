//
//  Deckable.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/14.
//

import Foundation

protocol Deckable: CustomStringConvertible {
    var cards: [LuckyCard] { get }
    
    func maximumSameCardCount() -> Int?
    mutating func sort()
}
extension Deckable {
    func maximumSameCardCount() -> Int? {
        cards.reduce(into: [Int: Int]()) { (dict, card) in
            dict[card.numberType.rawValue] = (dict[card.numberType.rawValue] ?? 0) + 1
        }.values.max()
    }
}
