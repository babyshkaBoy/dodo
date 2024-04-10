//
//  OrderDetailCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 29.08.2023.
//

import UIKit
import SnapKit

final class OrderDetailCell: UITableViewCell {
    
    static let reuseId = "OrderDetailCell"
    
    lazy var countLabel = createTextLabel("\(productsCount) товаров")
    lazy var priceLabel = createTextLabel("\(productsCount) руб")
    
    var productsCount: Int = 1
    var orderPrice: Int = 1
    
    let containerStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 20
        return stack
    }()
    
    func horizontalStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }
    
    let promoButton: UIButton = {
       let button = UIButton()
        button.setTitle("Вести промокод", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        
        button.backgroundColor = .orange
        button.layer.cornerRadius = 18
        
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true

        return button
    }()

    func createTextLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let countProductsStack = horizontalStack()
        let coinsStack = horizontalStack()
        let deliveryStack = horizontalStack()
        
        let titleCoinLable = createTextLabel("Начислим додокоинов")
        let coinsLabel = createTextLabel("+100")
        let deliveryLabel = createTextLabel("Доставка")
        let statusDeliveryLabel = createTextLabel("Бесплатно")
        
        contentView.addSubview(containerStack)
        
        containerStack.addArrangedSubview(promoButton)
        containerStack.addArrangedSubview(countProductsStack)
        containerStack.addArrangedSubview(coinsStack)
        containerStack.addArrangedSubview(deliveryStack)
        
        countProductsStack.addArrangedSubview(countLabel)
        countProductsStack.addArrangedSubview(priceLabel)

        
        coinsStack.addArrangedSubview(titleCoinLable)
        coinsStack.addArrangedSubview(coinsLabel)
        
        deliveryStack.addArrangedSubview(deliveryLabel)
        deliveryStack.addArrangedSubview(statusDeliveryLabel)
}
    func setupConstraints() {
        containerStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(20)
            make.left.right.equalTo(contentView).inset(20)

        }
    }
    ///
    func update(_ count: Int, price: Int) {
        
        countLabel.text = "\(count) товара"
        priceLabel.text = "\(price) руб"
    }
}
