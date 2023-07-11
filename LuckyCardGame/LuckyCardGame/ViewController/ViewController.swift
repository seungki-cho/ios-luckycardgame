//
//  ViewController.swift
//  LuckyCardGame
//
//  Created by cho seungki on 2023/07/04.
//

import UIKit

fileprivate enum Constant {
    static let headerHeight = 44.0
    static let xMargin = 20.0
    static let yMargin = 10.0
    static let cornerRadius = 10.0
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
    lazy var footerView: FloorDeckView = {
        let view = FloorDeckView(frame: .zero)
        view.layer.cornerRadius = Constant.cornerRadius
        return view
    }()
    lazy var deckStackView: DeckStackView = {
        let view = DeckStackView()
        view.layer.cornerRadius = Constant.cornerRadius
        view.spacing = Constant.yMargin
        return view
    }()
    //MARK: - Property
    private var deckCount = 3
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        configureFrame()
    }
    
    //MARK: - Helper
    private func configureUI() {
        view.backgroundColor = .white
        [headerView, deckStackView, footerView].forEach {
            view.addSubview($0)
        }
        
        var da = [[LuckyCard]]()
        for i in 0..<3 {
            da.append(Array(repeating: .init(animalType: .cat, numberType: .eight), count: 6))
        }
        deckStackView.changeDecks(luckyDecks: da)
    }
    
    private func configureFrame() {
        let safeRect = view.safeAreaLayoutGuide.layoutFrame
        let deckHeight = (safeRect.height - Constant.headerHeight - Constant.yMargin * 6) / 6
        
        headerView.frame = CGRect(x: safeRect.minX + Constant.xMargin,
                                  y: safeRect.minY + Constant.yMargin,
                                  width: safeRect.width - Constant.xMargin * 2,
                                  height: Constant.headerHeight)
        
        let deckStackViewHeight = deckHeight * CGFloat(deckCount) +
                                  Constant.yMargin * CGFloat(deckCount-1)
        deckStackView.frame = CGRect(x: safeRect.minX + Constant.xMargin,
                                     y: headerView.frame.maxY + Constant.yMargin,
                                     width: safeRect.width - Constant.xMargin * 2,
                                     height: deckStackViewHeight)
        
        let largeFooterHeight = deckHeight * 2 + Constant.yMargin
        let smallFooterHeight = deckHeight
        let footerViewHeight = deckCount > 4 ? smallFooterHeight : largeFooterHeight
        footerView.frame = CGRect(x: safeRect.minX + Constant.xMargin,
                                  y: safeRect.maxY - footerViewHeight,
                                  width: safeRect.width - Constant.xMargin * 2,
                                  height: footerViewHeight - Constant.yMargin)
        
        deckStackView.configureFrame()
    }
    
    @objc private func didChangeCount(segement: UISegmentedControl) {
        deckCount = segement.selectedSegmentIndex + 3
        configureFrame()

        var da = [[LuckyCard]]()

        for _ in 0..<deckCount {
            da.append(Array(repeating: .init(animalType: .cat, numberType: .eight), count: [9,8,6][segement.selectedSegmentIndex]))
        }
        deckStackView.changeDecks(luckyDecks: da)
    }
}
