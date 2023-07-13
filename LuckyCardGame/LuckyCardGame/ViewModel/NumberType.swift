//
//  NumberType.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

/*
 struct -> enum 사용 이유
 
 Typeable을 준수하는 자료만 카드의 종류로 넣고 싶었습니다.
 Mutable한 값 타입이 class보단 더 적절하다고 생각합니다.
 
 12번째 카드만 제거하는 룰이 있어서, enum이 더 편했습니다.
 */

enum NumberType: Int, Typeable {
    case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve
    
    var description: String { rawValue < 10 ? "0\(rawValue)" : "\(rawValue)" }
}

extension NumberType: Comparable {
    static func < (lhs: NumberType, rhs: NumberType) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
