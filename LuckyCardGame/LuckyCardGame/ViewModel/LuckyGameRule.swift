//
//  LuckyGameRule.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

enum LuckyGameRule {
    case threePlayer, fourPlayer, fivePlayer
    
    var playerCount: Int {
        switch self {
        case .threePlayer:
            return 3
        case .fourPlayer:
            return 4
        case .fivePlayer:
            return 5
        }
    }
    
    var removalNumbers: [NumberType] {
        switch self {
        case .threePlayer:
            return [NumberType.twelve]
        default:
            return []
        }
    }
    
    var playerCardCount: Int {
        switch self {
        case .threePlayer:
            return 8
        case .fourPlayer:
            return 7
        case .fivePlayer:
            return 6
        }
    }
    
    var floorCardCount: Int {
        switch self {
        case .threePlayer:
            return 8
        case .fourPlayer:
            return 9
        case .fivePlayer:
            return 10
        }
    }
}
