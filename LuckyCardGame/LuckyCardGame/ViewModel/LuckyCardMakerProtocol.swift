//
//  LuckyCardMakerProtocol.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/13.
//

import Foundation

protocol LuckyCardMakerProtocol {
    func makeNewDeck(without numbers: [NumberType]) -> [LuckyCard]
}
