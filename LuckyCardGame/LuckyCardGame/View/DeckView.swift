//
//  DeckView.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/04.
//

import UIKit

fileprivate enum Constant {
    static let widthToHeightRatio = 0.60
    static let xMargin = 5.0
    static let yMargin = 5.0
}

final class DeckView: UIView {
    //MARK: - UI Property
    let alphabetLabel: PaddingLabel = {
        let label = PaddingLabel(frame: .zero, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
        label.textColor = .gray
        label.alpha = 0.5
        return label
    }()
    let cardViews: [CardView] = {
        let cardViews = (0..<8).map{ _ in CardView() }
        cardViews.forEach { cardView in
            cardView.isHidden = true;
            cardView.backgroundColor = .white;
            cardView.layer.cornerRadius = 15
        }
        return cardViews
    }()
    
    //MARK: - Property
    private var cardCount = 8
    private let alphabet: String
    
    //MARK: - LifeCycle
    init(_ alphabet: String) {
        self.alphabet = alphabet
        super.init(frame: .zero)
        configureUI()
    }
    
    private override init(frame: CGRect) {
        alphabet = "A"
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        alphabet = "A"
        super.init(coder: coder)
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureFrame()
    }
    
    //MARK: - Helper
    private func configureUI() {
        layer.cornerRadius = 10
        backgroundColor = .systemGray5
        
        addSubview(alphabetLabel)
        cardViews.forEach { addSubview($0) }
        
        alphabetLabel.text = alphabet
    }
    
    func configureFrame() {
        alphabetLabel.frame = CGRect(x: 10.0,
                                     y: frame.height / 4.0,
                                     width: frame.width,
                                     height: frame.height / 2.0)
        alphabetLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: frame.height / 2)
        
        let cardWidth = frame.height * Constant.widthToHeightRatio
        let cardSpacing = (frame.width - Constant.xMargin * 2 - cardWidth * Double(cardCount)) / Double(cardCount-1)
        
        for i in 0..<cardCount {
            cardViews[i].frame = CGRect(x: Constant.xMargin + Double(i) * (cardSpacing + cardWidth),
                                        y: Constant.yMargin,
                                        width: cardWidth,
                                        height: frame.height - Constant.yMargin * 2)
        }
    }
    
    func changeCards(_ cards: [LuckyCard]) {
        cardCount = cards.count
        cardViews.forEach { $0.isHidden = true }
        zip(cards, cardViews).forEach { (card: LuckyCard, cardView: CardView) in
            cardView.isHidden = false
            cardView.change(number: card.numberType.description,
                            animal: card.animalType.description)
        }
    }
}
