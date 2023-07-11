//
//  DeckView.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/04.
//

import UIKit

final class DeckView: CommonDeckView {
    //MARK: - UI Property
    let alphabetLabel: PaddingLabel = {
        let label = PaddingLabel(frame: .zero, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
        label.textColor = .gray
        label.alpha = 0.5
        return label
    }()
    
    //MARK: - Property
    let alphabet: String
    
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
    
    //MARK: - Helper
    override func configureUI() {
        layer.cornerRadius = 10
        backgroundColor = .systemGray5
        
        addSubview(alphabetLabel)
        cardViews.forEach { addSubview($0) }
        
        alphabetLabel.text = alphabet
    }
    
    override func configureFrame() {
        alphabetLabel.frame = CGRect(x: 10.0,
                                     y: frame.height / 4.0,
                                     width: frame.width,
                                     height: frame.height / 2.0)
        alphabetLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: frame.height / 2)
        
        let cardWidth = frame.height * Constant.widthToHeightRatio
        let cardSpacing = (frame.width - Constant.xMargin * 2 - cardWidth * Double(cardCount)) / Double(cardCount-1)
        
        cardViews.enumerated().forEach { index, cardView in
            cardView.frame = CGRect(x: Constant.xMargin + Double(index) * (cardSpacing + cardWidth),
                                    y: Constant.yMargin,
                                    width: cardWidth,
                                    height: bounds.height - Constant.yMargin * 2)
        }
    }
}
