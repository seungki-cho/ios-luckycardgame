//
//  LuckyGameService.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

final class LuckyGameService {
    //MARK: - Property
    private var rule: LuckyGameRule
    private var deck: LuckyDeck = .init()
    
    private var players: [LuckyDeck] = []
    private var floor: FloorDeck = .init()
    
    private let luckyCardMaker: LuckyCardMakerProtocol
    
    //MARK: - Lifecycle
    init(rule: LuckyGameRule, luckyCardMaker: LuckyCardMakerProtocol) {
        self.rule = rule
        self.luckyCardMaker = luckyCardMaker
        changeRule(rule)
    }
    
    //MARK: - Helper
    func changeRule(_ newRule: LuckyGameRule) {
        rule = newRule
        dealCard()
    }
    
    private func dealCard() {
        clearGame()
        makeNewDeck()
        distributeCards()
    }
    
    func getCardArray() -> [[LuckyCard]] {
        [mainPlayer.cards] + players.map { $0.cards } + [floor.cards]
    }
    
    private func clearGame() {
        deck = .init()
        mainPlayer = .init()
        players = (0..<rule.supportingPlayerCount).map { _ in Player() }
        floor = .init()
    }
    
    private func makeNewDeck() {
        deck = luckyCardMaker.makeNewDeck()
        deck.discardCard(numbers: rule.removalNumbers)
    }
    
    private func distributeCards() {
        let mainCards = (0..<rule.playerCardCount).map { _ in deck.drawCard().flipped() }
        mainPlayer.changeDeck(LuckyDeck(mainCards))
        
        for playerIndex in (0..<players.count) {
            let cards = (0..<rule.playerCardCount).map { _ in deck.drawCard() }
            players[playerIndex].changeDeck(LuckyDeck(cards))
        }
        
        let floorCards = (0..<rule.floorCardCount).map { _ in deck.drawCard()}
        floor.changeDeck(LuckyDeck(floorCards))
    }
    
    func sortMainPlayer() {
        mainPlayer.sortDeck()
    }
    
    func sortPlayer(by playerIndex: Int) {
        guard (0..<players.count) ~= playerIndex else { return }
        players[playerIndex].sortDeck()
    }
    
    func sortFloor() {
        floor.sortDeck()
    }
    
    func checkSameThreeCard() -> Bool {
        let maximumCardCounts = [mainPlayer.maximumSameCardCount(), floor.maximumSameCardCount()] + players.map { $0.maximumSameCardCount() }
        guard let maximumCardCount = maximumCardCounts.compactMap({ $0 }).max() else { return false }
        return maximumCardCount >= 3
    }
}
