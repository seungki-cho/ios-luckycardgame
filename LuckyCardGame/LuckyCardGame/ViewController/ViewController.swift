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
    static let yMargin = 20.0
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
    lazy var floorDeckView: FloorDeckView = {
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
    private let luckyGameService = LuckyGameService(rule: .threePlayer)
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupDeck(headerView.selectedSegmentIndex)
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        configureFrame()
    }
    
    //MARK: - Helper
    private func configureUI() {
        view.backgroundColor = .white
        [headerView, deckStackView, floorDeckView].forEach {
            view.addSubview($0)
        }
    }
    
    private func configureFrame() {
        let safeRect = view.safeAreaLayoutGuide.layoutFrame
        let deckHeight = (safeRect.height - Constant.headerHeight - Constant.yMargin * 7) / 6
        
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
        let floorView`Height = deckCount > 4 ? smallFooterHeight : largeFooterHeight
        floorDeckView.frame = CGRect(x: safeRect.minX + Constant.xMargin,
                                  y: safeRect.maxY - floorViewHeight - Constant.yMargin,
                                  width: safeRect.width - Constant.xMargin * 2,
                                  height: floorViewHeight)
        
        deckStackView.configureFrame()
    }
    
    @objc private func didChangeCount(segement: UISegmentedControl) {
        setupDeck(segement.selectedSegmentIndex)
    }
    
    private func setupDeck(_ selectedIndex: Int) {
        deckCount = selectedIndex + 3
        
        switch selectedIndex {
        case 0:
            luckyGameService.changeRule(.threePlayer)
        case 1:
            luckyGameService.changeRule(.fourPlayer)
        default:
            luckyGameService.changeRule(.fivePlayer)
        }
        
        
        var cards = luckyGameService.getCardArray()
        floorDeckView.changeCards(cards.removeLast())
        deckStackView.changeDecks(luckyDecks: cards)
        
        configureFrame()
    }
}
