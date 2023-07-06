//
//  Player.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

struct Player {
    private var hand: [LuckyCard] = []
    
    mutating func getCards(cards: [LuckyCard]) {
        hand.append(contentsOf: cards)
    }
}
