//
//  ProductCell.swift
//  CollectionViewInTableView
//
//  Created by Азамат Баев on 15.07.2023.
//

import UIKit
import SnapKit



class ProductCell: UITableViewCell {
    
    static let reuseId = "ProductCell"
    
    var product: Product?
    
    //1. Initialize closure
    //2. Call closure
    //3. Receive closure
    var onButtonTapped: ((Product)->())? //1. Init
    
    var containerView: UIView = {
        var view = UIView()
        //view.backgroundColor = .systemGray6
        //view.layer.cornerRadius = 8
        //view.layer.masksToBounds = true
        view.applyShadow(cornerRadius: 8)
        view.backgroundColor = .systemBackground
        //view.heightAnchor.constraint(equalToConstant: 160).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var verticalStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        stackView.alignment = .leading
        stackView.layer.cornerRadius = 15
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 12, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    var horizontalStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 12, trailing: 5)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    
    var nameLabel = Label(style: .name)
    
//    var nameLabel: UILabel = {
//        var label = UILabel()
//        label.text = "Пицца"
//        label.font = .boldSystemFont(ofSize: 20)
//        label.numberOfLines = 0
//        return label
//    }()
     var detailLabel = Label(style: .detail )
//    var detailLabel: UILabel = {
//        var label = UILabel()
//        label.text = "Состав пиццы"
//        label.textColor = .gray
//        //label.backgroundColor = .orange
//        label.numberOfLines = 0
//        label.font = .boldSystemFont(ofSize: 15)
//        return label
//    }()
    
    lazy var priceButton: UIButton = {
        
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "549 рублей"
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        //configuration.background.backgroundColor = .orange.withAlphaComponent(0.5)
        //configuration.cornerStyle = .medium
        //configuration.tit
        configuration.baseBackgroundColor = .orange.withAlphaComponent(0.7)
        configuration.baseForegroundColor = .brown
        
        let button = UIButton.init(configuration: configuration)
        
        let action = UIAction { [weak self] _ in
            print(#line)
            
            guard let product = self?.product else { return }
            self?.onButtonTapped?(product)
            
        }
        button.addAction(action, for: .touchUpInside)
        //button.
            
        return button
        
    }()
    
    var productImageView: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(named: "pizza1")
        imageView.contentMode = .scaleAspectFit
        let width = UIScreen.main.bounds.width
        imageView.heightAnchor.constraint(equalToConstant: 0.3 * width).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 0.3 * width).isActive = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        setupViews()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.selectionStyle = .none
    }
}

//MARK: - Event Handler

//extension ProductCell {
//    @objc func priceButtonTapped(sender: UIButton) {
//
//        guard let product else { return }
//        onButtonTapped?(product) //2. Call
//        //print(#line, #function)
//    }
//}

//MARK: - Public
extension ProductCell {
    func update(_ product: Product) {
        self.product = product
        nameLabel.text = product.title
        detailLabel.text = product.description
        priceButton.setTitle("\(product.price)", for: .normal)
        productImageView.image = UIImage(named: product.image)
    }
}

//MARK: - Layout
extension ProductCell {
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(productImageView)
        containerView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(detailLabel)
        verticalStackView.addArrangedSubview(priceButton)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView).inset(8)
        }
        productImageView.snp.makeConstraints { make in
            make.left.equalTo(containerView).offset(10)
            make.centerY.equalTo(containerView)
        }
        verticalStackView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(containerView).inset(10)
            make.left.equalTo(productImageView.snp.right).offset(10)
        }
    }
}


