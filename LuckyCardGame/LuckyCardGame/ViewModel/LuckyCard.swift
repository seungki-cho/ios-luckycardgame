//
//  LuckyCard.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

/*
 struct 사용 이유

 마찬가지로 값 타입이 좋았습니다.
 Reference 타입은 일단 성능이 좋지 않다. -> 참조가 한 번 더 있기 때문
 레퍼런스 -> 메모리 에서 가져올 때 -> 스택영역 -> 힙영역
 값 -> 스택영역
 
 제네릭 -> 타입을 따로 정해주지 않고 Typeable만 충족하도록 하게 하여,
 외부에서 상황에 따라 타입을 정할 수 있도록 했습니다.
 */

struct LuckyCard {
    let (animalType, numberType): (AnimalType, NumberType)
    var isFlipped = false

    var description: String { animalType.description + numberType.description }
    
    func flipped() -> LuckyCard {
        var card = self
        card.isFlipped.toggle()
        return card
    }
    
    func isLike(number: NumberType) -> Bool {
        numberType == number
    }
}

extension LuckyCard: Comparable {
    static func < (lhs: LuckyCard, rhs: LuckyCard) -> Bool {
        lhs.numberType < rhs.numberType
    }
}
