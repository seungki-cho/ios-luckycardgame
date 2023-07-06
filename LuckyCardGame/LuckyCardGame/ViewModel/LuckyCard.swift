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
 제네릭 -> 타입을 따로 정해주지 않고 Typeable만 충족하도록 하게 하여,
 외부에서 상황에 따라 타입을 정할 수 있도록 했습니다.
 */

struct LuckyCard {
    var (animalType, numberType): (AnimalType, NumberType)

    var description: String { animalType.description + numberType.description }
}
