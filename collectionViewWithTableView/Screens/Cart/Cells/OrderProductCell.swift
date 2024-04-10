//
//  ProductCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 29.08.2023.
//

import UIKit

final class OrderProductCell: UITableViewCell {
    
    static let reuseId = "OrderProductCell"
    
    var counterView = CounterView()
    var product: Product?
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let containerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 20
        return stack
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let productImage: UIImageView = {
        let productImage = UIImageView()
        productImage.image = UIImage(named: "Arriva")
        productImage.contentMode = .scaleAspectFit
        productImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        return productImage
    }()
    
    let changeLabel: UILabel = {
        let label = UILabel()
        label.text = "Изменить"
        label.textColor = .systemOrange
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let footerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func observeEvents() {
        
//        counterView.onDecreaseButtonTapped = {
//            
//        }
//        
//        counter
        
        //counterView.addTarget(nil, action: #selector(counterViewChanged(_:)), for: .valueChanged)
        
    }
//    @objc func counterViewChanged(_ sender: CounterView) {
//
//        sender.countValue
//    }
    
    
    func update(_ product: Product, index: Int) {
        self.product = product
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        detailLabel.text = product.size
        priceLabel.text = "\(product.price) руб."
        productImage.image = UIImage(named: product.image)
        
        counterView.countValue = product.count
        counterView.index = index
    }
}

extension OrderProductCell {
    
    func setupViews() {
        contentView.addSubview(containerStack)
        
        containerStack.addArrangedSubview(horizontalStackView)
        containerStack.addArrangedSubview(footerStackView)
        
        horizontalStackView.addArrangedSubview(productImage)
        horizontalStackView.addArrangedSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(detailLabel)
        
        
        //let emptyView = UIView()
        footerStackView.addArrangedSubview(priceLabel)
        footerStackView.addArrangedSubview(changeLabel)
        //footerStackView.addArrangedSubview(emptyView)
        footerStackView.addArrangedSubview(counterView)
        
    }
    
    func setupConstraints() {
        containerStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
        }
        horizontalStackView.snp.makeConstraints { make in
            make.left.right.equalTo(containerStack).inset(20)
        }
        verticalStackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(horizontalStackView).inset(10)
        }
        footerStackView.snp.makeConstraints { make in
            //make.left.right.equalTo(horizontalStackView)
            make.width.equalTo(UIScreen.main.bounds.width - 40)
            //make.centerX.equalToSuperview()
        }
        priceLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(footerStackView).inset(10)
            make.left.equalTo(footerStackView.snp.left)
        }
        counterView.snp.makeConstraints { make in
            make.left.equalTo(changeLabel.snp.right).offset(10)
        }
    }
}
