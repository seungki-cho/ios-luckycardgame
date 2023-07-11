//
//  CardView.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/06.
//

import UIKit

final class CardView: UIView {
    //MARK: - UI Property
    private let topNumberLabel = {
        let label = UILabel()
        label.font = .init(name: "Verdana", size: 100)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private let animalLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 100)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private let bottomNumberLabel = {
        let label = UILabel()
        label.font = .init(name: "Verdana", size: 100)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private let backImageView = {
        let imageView = UIImageView(image: UIImage.LogoImage)
        imageView.isHidden = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    //MARK: - Property
    var isFlipped = false {
        willSet {
            backImageView.isHidden = newValue
            [topNumberLabel, animalLabel, bottomNumberLabel].forEach { $0.isHidden = !newValue }
        }
    }
    
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
        [topNumberLabel, animalLabel, bottomNumberLabel, backImageView].forEach {
            addSubview($0)
        }
    }
    
    private func configureFrame() {
        topNumberLabel.frame = CGRect(x: bounds.width / 12,
                                      y: bounds.height / 12,
                                      width: bounds.width / 3,
                                      height: bounds.height / 4)
        
        animalLabel.frame = CGRect(x: bounds.maxX / 2 - bounds.width / 4,
                                   y: bounds.maxY / 2 - bounds.height / 4,
                                   width: bounds.width / 2,
                                   height: bounds.height / 2)
        
        backImageView.frame = CGRect(x: bounds.maxX / 2 - (bounds.width / 4),
                                     y: bounds.maxY / 2 - (bounds.height / 4),
                                     width: bounds.width / 2,
                                     height: bounds.height / 2)

        bottomNumberLabel.frame = CGRect(x: bounds.maxX - bounds.width / 3,
                                         y: bounds.maxY - bounds.height / 3,
                                         width: bounds.width / 3,
                                         height: bounds.height / 4)
        
    }
    
    func change(number: String, animal: String) {
        let number = String(Int(number) ?? 1)
        (topNumberLabel.text, bottomNumberLabel.text) = (number, number)
        animalLabel.text = animal
    }
}
