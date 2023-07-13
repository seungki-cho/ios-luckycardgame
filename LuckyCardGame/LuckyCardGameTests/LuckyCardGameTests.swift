//
//  LuckyCardGameTests.swift
//  LuckyCardGameTests
//
//  Created by cho seungki on 2023/07/04.
//

import XCTest
@testable import LuckyCardGame

final class LuckyCardGameTests: XCTestCase {
    
    var sut: LuckyGameService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LuckyGameService(rule: .fivePlayer, luckyCardMaker: LuckyCardMaker())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    func test세명룰일때_카드를나눠주면_12카드가없다() throws {
        // Given
        sut = .init(rule: .threePlayer, luckyCardMaker: LuckyCardMaker())
        // When
        let isNoTwelveCard = sut.getCardArray().flatMap { $0 }.map { $0.numberType.rawValue }.allSatisfy { $0 != 12 }
        // Then
        XCTAssertTrue(isNoTwelveCard)
    }
    func test세명룰일때_카드를나눠주면_개수가일치한다() throws {
        // Given
        let sut = LuckyGameService(rule: .threePlayer, luckyCardMaker: LuckyCardMaker())
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
        let sut = LuckyGameService(rule: .fourPlayer, luckyCardMaker: LuckyCardMaker())
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
        let sut = LuckyGameService(rule: .fivePlayer, luckyCardMaker: LuckyCardMaker())
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
        sut.sortPlayer(by: 0)
        // When
        let mainPlayerDeck = sut.getCardArray()[0]
        let sortedNumbers = mainPlayerDeck.map { $0.numberType }
        // Then
        var maxNumber = 0
        for number in sortedNumbers {
            XCTAssertGreaterThanOrEqual(number.rawValue, maxNumber)
            maxNumber = number.rawValue
        }
    }
    func test인덱스별로_플레이어를_정렬한다() throws {
        // Given
        let sut = LuckyGameService(rule: .fivePlayer, luckyCardMaker: MockLuckyCardMaker())
        sut.sortPlayer(by: 2)
        // When
        let playerDeck = sut.getCardArray()[2]
        let sortedNumbers = playerDeck.map { $0.numberType }
        // Then
        var maxNumber = 0
        for number in sortedNumbers {
            XCTAssertGreaterThanOrEqual(number.rawValue, maxNumber)
            maxNumber = number.rawValue
        }
    }
    func test바닥카드를_오름차순정렬한다() throws {
        // Given
        let sut = LuckyGameService(rule: .fivePlayer, luckyCardMaker: MockLuckyCardMaker())
        sut.sortFloor()
        // When
        let floorDeck = sut.getCardArray()[5]
        let sortedNumbers = floorDeck.map { $0.numberType }
        // Then
        var maxNumber = 0
        for number in sortedNumbers {
            XCTAssertGreaterThanOrEqual(number.rawValue, maxNumber)
            maxNumber = number.rawValue
        }
    }
    
    func test한명이_세개의숫자가같은카드를갖고있나() throws {
        // Given
        let newDeck = (0..<36).map{ _ in LuckyCard(animalType: .cat, numberType: .eleven)}
        sut = LuckyGameService(rule: .fivePlayer, luckyCardMaker: MockLuckyCardMaker(cards: newDeck))
        // When
        let result = sut.checkSameThreeCard()
        print(result)
        // Then
        XCTAssertTrue(result)
    }
    
    func test세장의카드를뽑아서_같은지판단한다() throws {
        // Given
        sut = .init(rule: .threePlayer,
                    luckyCardMaker: MockLuckyCardMaker(cards: MockLuckyCardMaker.pickThreeCardTestDeck))
        // When
        (0..<LuckyGameRule.threePlayer.playerCount).forEach { sut.sortPlayer(by: $0) }
        
        let choices: [(playerIndex: Int, isGreater: Bool)] = [(0, true), (1, true), (2, true)]
        let result = sut.isSame(threeCards: choices)
        // Then
        XCTAssertTrue(result)
    }
    
    func test바닥을포함하여_세장의카드를뽑아서_같은지판단한다() throws {
        // Given
        sut = .init(rule: .threePlayer,
                    luckyCardMaker: MockLuckyCardMaker(cards: MockLuckyCardMaker.pickThreeCardTestDeck))
        // When
        (0..<LuckyGameRule.threePlayer.playerCount).forEach { sut.sortPlayer(by: $0) }
        
        let choices: [(playerIndex: Int, isGreater: Bool)] = [(1, false), (2, false)]
        let result = sut.isSame(threeCards: choices, floorCardIndex: 5)
        // Then
        XCTAssertTrue(result)
    }
    
    func test세장의카드를뽑아서_다른지판단한다() throws {
        // Given
        sut = .init(rule: .threePlayer,
                    luckyCardMaker: MockLuckyCardMaker(cards: MockLuckyCardMaker.pickThreeCardTestDeck))
        // When
        (0..<LuckyGameRule.threePlayer.playerCount).forEach { sut.sortPlayer(by: $0) }
        
        let choices: [(playerIndex: Int, isGreater: Bool)] = [(0, true), (1, false), (2, true)]
        let result = sut.isSame(threeCards: choices)
        // Then
        XCTAssertFalse(result)
    }
}
