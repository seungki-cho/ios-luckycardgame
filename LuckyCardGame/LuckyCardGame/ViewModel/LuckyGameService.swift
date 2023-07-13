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
        players.map { $0.cards } + [floor.cards]
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
        
        let floorCards = deck // 덱에서 floorCardCount 만큼으로 변경
        floor = FloorDeck(floorCards)
    }
    
    func sortPlayer(by playerIndex: Int) {
        guard (0..<players.count) ~= playerIndex else { return }
        players[playerIndex].sort()
    }
    
    func sortFloor() {
        floor.sort()
    }
    
    func checkSameThreeCard() -> Bool {
        let maximumCardCounts = [floor.maximumSameCardCount()] + players.map { $0.maximumSameCardCount() }
        guard let maximumCardCount = maximumCardCounts.compactMap({ $0 }).max() else { return false }
        return maximumCardCount >= 3
    }
    
    func isSame(threeCards choices: [(playerIndex: Int, isGreater: Bool)], floorCardIndex: Int? = nil) -> Bool {
        guard (choices.count == 2 && floorCardIndex != nil) ||
                (choices.count == 3 && floorCardIndex == nil),
              choices.allSatisfy({ (0..<rule.playerCount) ~= $0.playerIndex }) else { return false }
        
        var selectedCards = choices.map { (index, isGreater) in
            players[index].showSideCard(isGreater: isGreater)
        }
        if let floorCardIndex {
            selectedCards.append(floor.showCard(at: floorCardIndex))
        }
        
        let nonNilCards = selectedCards.compactMap { $0 }
        if nonNilCards.count == 3, nonNilCards.allSatisfy({ $0.isLike(number: nonNilCards[0].numberType)}) {
            return true
        }
        return false
    }
}
