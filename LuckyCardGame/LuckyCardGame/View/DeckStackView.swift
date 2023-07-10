//
//  DeckStackView.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/04.
//

import UIKit

final class DeckStackView: UIView {
    //MARK: - UI Property
    private lazy var deckViews: [DeckView] = {
        let subDeckViews = ["A", "B", "C", "D", "E"].map { DeckView($0) }
        return subDeckViews
    }()
    
    
    //MARK: - Property
    private var deckCount = 3
    var spacing: CGFloat = 0.0

    //MARK: - LifeCycle
    init() {
        super.init(frame: .zero)
        deckViews.forEach { addSubview($0) }
        configureFrame()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        deckViews.forEach { addSubview($0) }
        configureFrame()
    }
    
    //MARK: - Helper
    func changeDecks(luckyDecks: [[LuckyCard]]) {
        deckViews.forEach { $0.isHidden = true }
        zip(luckyDecks, deckViews).forEach { deck, deckView in
            deckView.isHidden = false
            deckView.changeCards(deck)
        }
        deckCount = luckyDecks.count
        configureFrame()
    }
    
    func configureFrame() {
        let deckHeight = (bounds.height - CGFloat(deckCount) * spacing) / CGFloat(deckCount)
        deckViews.enumerated().forEach { offset, deckView in
            deckView.frame = CGRect(x: 0,
                                    y: CGFloat(offset) * (spacing + deckHeight),
                                    width: frame.width,
                                    height: deckHeight)
            deckView.configureFrame()
        }
    }
}
