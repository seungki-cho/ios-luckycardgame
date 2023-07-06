//
//  AnimalType.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

/*
 enum 사용 이유
 
 한정된 경우만 나올 경우 케이스만 관리하면 편하다고 생각합니다.
 마찬가지로 케이스의 추가와 삭제로 관리가 편하다고 생각합니다.
 
 nested enum사용 안 한 이유
 카드안에 타입이 한정되어 있다면, 게임 로직에서 LuckyCard.AnimalType.dog 와 같이 써야해서 불편하다고 생각했습니다.
 */

enum AnimalType: String, Typeable {
    typealias ValueType = String
    
    case dog = "🐶", cat = "🐱", cow = "🐮"
    
    var value: String { self.rawValue }
    var description: String { self.rawValue }
}

