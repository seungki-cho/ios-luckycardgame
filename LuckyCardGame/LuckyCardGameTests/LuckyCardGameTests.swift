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
        sut = LuckyGameService(rule: .threePlayer)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test룰에따라카드를나눠주면_개수가일치한다() throws {
        try test네명룰일때_카드를나눠주면_개수가일치한다()
        try test세명룰일때_카드를나눠주면_개수가일치한다()
        try test다섯명룰일때_카드를나눠주면_개수가일치한다()
    }
    func test세명룰일때_카드를나눠주면_개수가일치한다() throws {
        // Given
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
        XCTAssertEqual(cards[4].count, floorCardCount)
    }

}
