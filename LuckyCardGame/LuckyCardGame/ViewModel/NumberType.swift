//
//  NumberType.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

/*
 struct 사용 이유
 
 Typeable을 준수하는 자료만 카드의 종류로 넣고 싶었습니다.
 Mutable한 값 타입이 class보단 더 적절하다고 생각합니다.
 */

struct NumberType: Typeable {
    static var allCases: [NumberType] = (1...12).map{ NumberType(value: $0) }
    
    typealias ValueType = Int
    
    init(value: Int) {
        self.value = (1...12) ~= value ? value : 1
    }
    
    var value: Int
    var description: String { value >= 10 ? "\(value)" : "0\(value)" }
}
