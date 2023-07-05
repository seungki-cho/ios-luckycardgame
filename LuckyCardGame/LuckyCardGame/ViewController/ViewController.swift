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
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = Constant.cornerRadius
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
}
