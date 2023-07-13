//
//  LuckyGameService.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import Foundation

final class LuckyGameService {
    private var rule: LuckyGameRule
    private var deck: LuckyDeck = .init()
    
    private var mainPlayer: Player = .init()
    private var players: [Player] = []
    private var floor: Player = .init()
    
    init(rule: LuckyGameRule) {
        self.rule = rule
    }
    
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
        [mainPlayer.showCards()] + players.map { $0.showCards() } + [floor.showCards()]
    }
    
    private func clearGame() {
        deck = .init()
        mainPlayer = .init()
        players = (0..<rule.supportingPlayerCount).map { _ in Player() }
        floor = .init()
    }
    
    private func makeNewDeck() {
        deck.discardCard(numbers: rule.removalNumbers)
        let cards = AnimalType.allCases.flatMap { animal in
            NumberType.allCases.map { LuckyCard(animalType: animal, numberType: $0)}
        }.shuffled()
        deck.appendCards(cards)
    }
    
    private func distributeCards() {
        mainPlayer.receiveCards((0..<rule.playerCardCount).map { _ in deck.drawCard().flipped() })
        for playerIndex in (0..<players.count) {
            let cards = (0..<rule.playerCardCount).map { _ in deck.drawCard() }
            players[playerIndex].receiveCards(cards)
        }
        floor.receiveCards((0..<rule.floorCardCount).map { _ in deck.drawCard()})
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
}
