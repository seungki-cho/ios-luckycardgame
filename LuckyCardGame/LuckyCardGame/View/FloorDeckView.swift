//
//  FloorDeckView.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/10.
//

import UIKit

final class FloorDeckView: CommonDeckView {
    //MARK: - UI Property
    
    //MARK: - Property

    //MARK: - LifeCycle
    
    //MARK: - Helper
    override func configureUI() {
        super.configureUI()
        backgroundColor = .gray
    }
    
    override func configureFrame() {
        if cardCount == 9 {
            let cardHeight = (bounds.height - 3 * Constant.yMargin) / 2
            let cardWidth = cardHeight * Constant.widthToHeightRatio
            let cardSpacing = (bounds.width - 5 * cardWidth) / 6
        
            cardViews.enumerated().forEach { index, cardView in
                cardView.frame = CGRect(x: cardSpacing + Double(index % 5) * (cardSpacing + cardWidth),
                                        y: index < 5 ? Constant.yMargin : (Constant.yMargin + cardHeight),
                                        width: cardWidth,
                                        height: cardHeight)
            }
        } else if cardCount == 8 {
            let cardHeight = (bounds.height - 3 * Constant.yMargin) / 2
            let cardWidth = cardHeight * Constant.widthToHeightRatio
            let cardSpacing = (bounds.width - 4 * cardWidth) / 5
            
            cardViews.enumerated().forEach { index, cardView in
                cardView.frame = CGRect(x: cardSpacing + Double(index % 4) * (cardSpacing + cardWidth),
                                        y: index < 4 ? Constant.yMargin : (Constant.yMargin + cardHeight),
                                        width: cardWidth,
                                        height: cardHeight)
            }
        } else {
            let cardHeight = (bounds.height - 2 * Constant.yMargin)
            let cardWidth = cardHeight * Constant.widthToHeightRatio
            let cardSpacing = (frame.width - Constant.xMargin * 2 - cardWidth * Double(cardCount)) / Double(cardCount-1)
            
            cardViews.enumerated().forEach { index, cardView in
                cardView.frame = CGRect(x: Constant.xMargin + Double(index) * (cardSpacing + cardWidth),
                                        y: Constant.yMargin,
                                        width: cardWidth,
                                        height: frame.height - Constant.yMargin * 2)
            }
        }
    }
}

