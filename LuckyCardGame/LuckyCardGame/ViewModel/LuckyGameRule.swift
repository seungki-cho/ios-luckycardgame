//
//  LuckyGameRule.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

enum LuckyGameRule: Int {
    case threePlayer, fourPlayer, fivePlayer
    
    var supportingPlayerCount: Int {
        switch self {
        case .threePlayer:
            return 2
        case .fourPlayer:
            return 3
        case .fivePlayer:
            return 4
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
            return 9
        case .fourPlayer:
            return 8
        case .fivePlayer:
            return 6
        }
    }
}
