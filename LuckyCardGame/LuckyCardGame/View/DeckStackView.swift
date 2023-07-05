//
//  DeckStackView.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/04.
//

import UIKit

final class DeckStackView: UIView {
    var subDecks: [DeckView] = []
    
    var spacing: CGFloat = 0.0 {
        didSet {
            configureFrame()
        }
    }
    var deckHeight: CGFloat = 0.0 {
        didSet {
            configureFrame()
        }
    }
    
    func append() {
        let deck = DeckView()
        subDecks.append(deck)
        addSubview(deck)
        configureFrame()
    }
    
    func removeLast() {
        subDecks.removeLast()
        configureFrame()
    }
    
    func configureFrame() {
        subDecks.enumerated().forEach { offset, deckView in
            deckView.frame = CGRect(x: 0,
                                    y: CGFloat(offset) * (spacing + deckHeight),
                                    width: frame.width,
                                    height: deckHeight)
            deckView.configureFrame(String(UnicodeScalar(65 + offset) ?? "A"))
        }
    }
}
