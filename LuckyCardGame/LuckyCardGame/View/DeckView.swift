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
    lazy var alphabetLabel: PaddingLabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
        label.textColor = .gray
        label.alpha = 0.5
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        layer.cornerRadius = 10
        backgroundColor = .systemGray5
        
        addSubview(alphabetLabel)
    }
    
    func configureFrame(_ alphabet: String) {
        alphabetLabel.frame = CGRect(x: 10.0,
                                     y: frame.height / 4.0,
                                     width: frame.width,
                                     height: frame.height / 2.0)
        alphabetLabel.font = .init(name: "AvenirNext-BoldItalic", size: frame.height/2)
        alphabetLabel.text = alphabet
    }
}
