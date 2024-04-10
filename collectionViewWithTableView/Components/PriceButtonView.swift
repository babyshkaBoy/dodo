//
//  PriceButtonView.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 29.08.2023.
//

import UIKit
import SnapKit

enum PriceButtonType {
    case detail
    case cart
}

final class PriceButtonView: UIView {
    
    var onPriceButtonTapped: ((Product?)->())? //1. declaration
    
    var product: Product?
    var type: PriceButtonType
    
    lazy var priceButton: UIButton = {
        let button = UIButton()
        //button.setTitle("Оформить заказ на \(0)руб", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.backgroundColor = .orange
        button.addTarget(nil, action: #selector(priceButtonTyped), for: .touchUpInside)
        return button
    }()
    
    init(type: PriceButtonType) {
        self.type = type
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        
//        switch type {
//
//        case .detail:
//            orderButton.setTitle("В корзину за \(0)руб.", for: .normal)
//        case .cart:
//            orderButton.setTitle("Оформить заказ на \(0)руб", for: .normal)
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        self.backgroundColor = .white
        addSubview(priceButton)
    }
    private func setupConstraints() {
        priceButton.snp.makeConstraints { make in
            make.left.right.top.equalTo(self).inset(20)
            make.bottom.equalTo(self).inset(40)
        }
    }
    /// передача цены в orderButton
    func update(_ price: Int) {
        priceButton.setTitle("В корзину за \(price)руб.", for: .normal)
        
    }
    
    func update(_ product: Product) {
        self.product = product
        
        switch type {
            
        case .detail:
            priceButton.setTitle("В корзину за \(product.price)руб.", for: .normal)
        case .cart:
            priceButton.setTitle("Оформить заказ на \(product.price)руб", for: .normal)
        }
        
    }
    @objc func priceButtonTyped() {
        
        onPriceButtonTapped?(product) //2. call
        
    }
}
