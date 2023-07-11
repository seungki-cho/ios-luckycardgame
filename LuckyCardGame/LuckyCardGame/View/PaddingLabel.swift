//
//  PaddingLabel.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/04.
//

import UIKit

final class PaddingLabel: UILabel {
    private var padding: UIEdgeInsets = .zero
    
    init(frame: CGRect, padding: UIEdgeInsets) {
        super.init(frame: frame)
        self.padding = padding
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
}
