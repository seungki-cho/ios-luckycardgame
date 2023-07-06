//
//  Typeable.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

/*
 Protocol 사용 이유
 
 카드에 들어갈 수 있는 타입이 되기 위한 조건을 명시하기 위해 사용했습니다.
 CaseIterable -> 하나씩 뽑기 위해 사용했습니다.
 CustomStringConvertible -> 출력을 위해 사용했습니다.
 associatedtype 지정 -> Animal과 숫자 대신 다른 타입도 사용할 수 있도록 했습니다.
*/

protocol Typeable: CaseIterable, CustomStringConvertible { }
