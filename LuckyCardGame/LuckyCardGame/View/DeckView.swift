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
    
    private func configureUI() {
        layer.cornerRadius = 10
        backgroundColor = .systemGray5
        
        addSubview(alphabetLabel)
        alphabetLabel.text = alphabet
    }
    
    func configureFrame() {
        alphabetLabel.frame = CGRect(x: 10.0,
                                     y: frame.height / 4.0,
                                     width: frame.width,
                                     height: frame.height / 2.0)
        alphabetLabel.font = .init(name: "AvenirNext-BoldItalic", size: frame.height/2)
        alphabetLabel.text = alphabet
    }
}
