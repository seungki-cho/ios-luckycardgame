//
//  LuckyCardGameTests.swift
//  LuckyCardGameTests
//
//  Created by cho seungki on 2023/07/04.
//

import XCTest
@testable import LuckyCardGame

final class LuckyCardGameTests: XCTestCase {
    
    func test세명룰일때_카드를나눠주면_개수가일치한다() throws {
        // Given
        let sut = LuckyGameService(rule: .threePlayer, luckyCardMaker: LuckyCardMaker())
        let rule: LuckyGameRule = .threePlayer
        sut.changeRule(rule)
        // When
        let cards = sut.getCardArray()
        let cardCount = 8
        let floorCardCount = 9
        // Then
        XCTAssertEqual(cards[0].count, cardCount)
        XCTAssertEqual(cards[1].count, cardCount)
        XCTAssertEqual(cards[2].count, cardCount)
        XCTAssertEqual(cards[3].count, floorCardCount)
    }
    func test네명룰일때_카드를나눠주면_개수가일치한다() throws {
        // Given
        let sut = LuckyGameService(rule: .threePlayer, luckyCardMaker: LuckyCardMaker())
        let rule: LuckyGameRule = .fourPlayer
        sut.changeRule(rule)
        // When
        let cards = sut.getCardArray()
        let cardCount = 7
        let floorCardCount = 8
        // Then
        XCTAssertEqual(cards[0].count, cardCount)
        XCTAssertEqual(cards[1].count, cardCount)
        XCTAssertEqual(cards[2].count, cardCount)
        XCTAssertEqual(cards[3].count, cardCount)
        XCTAssertEqual(cards[4].count, floorCardCount)
    }
    func test다섯명룰일때_카드를나눠주면_개수가일치한다() throws {
        // Given
        let sut = LuckyGameService(rule: .threePlayer, luckyCardMaker: LuckyCardMaker())
        let rule: LuckyGameRule = .fivePlayer
        sut.changeRule(rule)
        // When
        let cards = sut.getCardArray()
        let cardCount = 6
        let floorCardCount = 6
        // Then
        XCTAssertEqual(cards[0].count, cardCount)
        XCTAssertEqual(cards[1].count, cardCount)
        XCTAssertEqual(cards[2].count, cardCount)
        XCTAssertEqual(cards[3].count, cardCount)
        XCTAssertEqual(cards[4].count, cardCount)
        XCTAssertEqual(cards[5].count, floorCardCount)
    }
    
    func test메인플레이어를_오름차순정렬한다() throws {
        // Given
        let sut = LuckyGameService(rule: .threePlayer, luckyCardMaker: MockLuckyCardMaker())
        sut.sortMainPlayer()
        // When
        let mainPlayerDeck = sut.getCardArray()[0]
        let sortedNumbers = mainPlayerDeck.map { $0.numberType }
        // Then
        var maxNumber = 0
        for number in sortedNumbers {
            XCTAssertGreaterThan(number.rawValue, maxNumber)
            maxNumber = number.rawValue
        }
    }
    func test인덱스별로_플레이어를_정렬한다() throws {
        // Given
        let sut = LuckyGameService(rule: .fivePlayer, luckyCardMaker: MockLuckyCardMaker())
        sut.sortPlayer(by: 2)
        // When
        let playerDeck = sut.getCardArray()[0]
        let sortedNumbers = playerDeck.map { $0.numberType }
        // Then
        var maxNumber = 0
        for number in sortedNumbers {
            XCTAssertGreaterThan(number.rawValue, maxNumber)
            maxNumber = number.rawValue
        }
    }
    func test바닥카드를_오름차순정렬한다() throws {
        // Given
        let sut = LuckyGameService(rule: .fivePlayer, luckyCardMaker: MockLuckyCardMaker())
        sut.sortPlayer(by: 2)
        // When
        let floorDeck = sut.getCardArray()[0]
        let sortedNumbers = floorDeck.map { $0.numberType }
        // Then
        var maxNumber = 0
        for number in sortedNumbers {
            XCTAssertGreaterThan(number.rawValue, maxNumber)
            maxNumber = number.rawValue
        }
    }
}
