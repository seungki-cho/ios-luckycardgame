//
//  PaddingLabel.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/04.
//

import UIKit

final class PaddingLabel: UILabel {
    private var padding: UIEdgeInsets = .zero
    
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
}
