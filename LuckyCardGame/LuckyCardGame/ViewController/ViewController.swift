//
//  ViewController.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/04.
//

import UIKit

fileprivate enum Constant {
    static var deckCount = 5
    static let headerHeight = 44.0
    static let xMargin = 20.0
    static let yMargin = 10.0
    static let cornerRadius = 10.0
    
    static var deckHeight = UIScreen.main.bounds.height / CGFloat(deckCount + 4)
}

final class ViewController: UIViewController {
    //MARK: - UI
    lazy var headerView: UISegmentedControl = {
        let view = UISegmentedControl(items: ["3명", "4명", "5명"])
        view.selectedSegmentIndex = 0
        view.layer.cornerRadius = Constant.cornerRadius
        view.addTarget(self, action: #selector(didChangeCount(segement: )), for: .valueChanged)
        return view
    }()
    lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = Constant.cornerRadius
        return view
    }()
    lazy var deckStackView: DeckStackView = {
        let view = DeckStackView()
        view.layer.cornerRadius = Constant.cornerRadius
        view.spacing = Constant.yMargin
        view.deckHeight = Constant.deckHeight
        return view
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        
        let deck = LuckyDeck()
        print(deck.description)
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        configureFrame()
    }
    
    //MARK: - Helper
    private func configureUI() {
        [headerView, deckStackView, footerView].forEach {
            view.addSubview($0)
        }
        (0..<Constant.deckCount).forEach { _ in deckStackView.append() }
    }
    
    private func configureFrame() {
        let safeRect = view.safeAreaLayoutGuide.layoutFrame
        
        headerView.frame = CGRect(x: safeRect.minX + Constant.xMargin,
                                  y: safeRect.minY + Constant.yMargin,
                                  width: safeRect.width - Constant.xMargin * 2,
                                  height: Constant.headerHeight)
        
        let deckStackViewHeight = Constant.deckHeight * CGFloat(Constant.deckCount) +
                                  Constant.yMargin * CGFloat(Constant.deckCount-1)
        deckStackView.frame = CGRect(x: safeRect.minX + Constant.xMargin,
                                     y: headerView.frame.maxY + Constant.yMargin,
                                     width: safeRect.width - Constant.xMargin * 2,
                                     height: deckStackViewHeight)
        
        let footerViewHeight = safeRect.maxY - (Constant.yMargin + deckStackView.frame.maxY)
        footerView.frame = CGRect(x: safeRect.minX + Constant.xMargin,
                                  y: deckStackView.frame.maxY + Constant.yMargin,
                                  width: safeRect.width - Constant.xMargin * 2,
                                  height: footerViewHeight - Constant.yMargin)
        
        deckStackView.configureFrame()
    }
    
    @objc private func didChangeCount(segement: UISegmentedControl) {
        
    }
}
