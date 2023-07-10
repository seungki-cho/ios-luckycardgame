//
//  CardView.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import UIKit

class CardView: UIView {
    //MARK: - UI Property
    private let topNumberLabel = {
        let label = UILabel()
        label.font = .init(name: "Verdana", size: 13)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private let animalLabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private let bottomNumberLabel = {
        let label = UILabel()
        label.font = .init(name: "Verdana", size: 13)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
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
    private func configureUI() {
        layer.borderWidth = 1.0
        [topNumberLabel, animalLabel, bottomNumberLabel].forEach {
            addSubview($0)
        }
    }
    
    private func configureFrame() {
        topNumberLabel.frame = CGRect(x: bounds.width / 10,
                                      y: bounds.height / 13,
                                      width: bounds.width / 3,
                                      height: bounds.height / 4)
        
        animalLabel.frame = CGRect(x: bounds.maxX / 2 - bounds.width / 6,
                                   y: bounds.maxY / 2 - bounds.height / 6,
                                   width: bounds.width / 3,
                                   height: bounds.height / 4)

        bottomNumberLabel.frame = CGRect(x: bounds.maxX - bounds.width / 4,
                                         y: bounds.maxY - bounds.height / 3,
                                         width: bounds.width / 3,
                                         height: bounds.height / 4)
    }
}
