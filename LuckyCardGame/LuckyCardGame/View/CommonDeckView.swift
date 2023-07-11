//
//  CommonDeckView.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/10.
//

import UIKit

class CommonDeckView: UIView {
    enum Constant {
        static let widthToHeightRatio = 0.63
        static let xMargin = 5.0
        static let yMargin = 5.0
    }
    
    //MARK: - UI Property
    let cardViews: [CardView] = {
        let cardViews = (0..<9).map{ _ in CardView() }
        cardViews.forEach { cardView in
            cardView.isHidden = true;
            cardView.backgroundColor = .white;
            cardView.layer.cornerRadius = 15
        }
        return cardViews
    }()
    //MARK: - Property
    var cardCount = 8
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureFrame()
    }
    
    //MARK: - Helper
    func configureUI() {
        cardViews.forEach { addSubview($0) }
    }
    
    func configureFrame() {
        fatalError("상속받는다면, 구현해야 합니다.")
    }
    
    func changeCards(_ cards: [LuckyCard]) {
        cardCount = cards.count
        cardViews.forEach { $0.isHidden = true }
        
        zip(cards, cardViews).forEach { (card: LuckyCard, cardView: CardView) in
            cardView.isHidden = false
            cardView.change(number: card.numberType.description,
                            animal: card.animalType.description)
            cardView.isFlipped = card.isFlipped
        }
        
        configureFrame()
    }
}
