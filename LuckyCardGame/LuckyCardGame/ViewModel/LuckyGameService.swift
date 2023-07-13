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
        distributeNewCards()
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
    
    private func distributeNewCards() {
        var deck = luckyCardMaker.makeNewDeck(without: rule.removalNumbers)
        players = (0..<rule.playerCount).map { _ in LuckyDeck() }
        
        players[0] = LuckyDeck(deck[0..<rule.playerCardCount].map{ $0.flipped() })
        deck.removeFirst(rule.playerCardCount)
        
        for playerIndex in (1..<players.count) {
            players[playerIndex] = LuckyDeck(Array(deck[0..<rule.playerCardCount]))
            deck.removeFirst(rule.playerCardCount)
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
