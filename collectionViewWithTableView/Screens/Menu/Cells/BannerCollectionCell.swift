//
//  BannerCollectionCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 19.08.2023.
//

import UIKit

class BannerCollectionCell: UICollectionViewCell {
    
    var onPriceButtonTapped: ((Product)->())?
    var product: Product?
    
    static var reuseId = "BannerCollectionCell"
    
    var containerView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.applyShadow(cornerRadius: 8)
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Пицца Миксик"
        label.numberOfLines = 0
        return label
    }()
    var priceButton: UIButton = {
        var button = UIButton()
        button.setTitle("от 289 руб", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(nil, action: #selector(priceButtonTapped), for: .touchUpInside)
        button.backgroundColor = .orange.withAlphaComponent(0.3)
        button.layer.cornerRadius = 12
        let width = UIScreen.main.bounds.width
        button.widthAnchor.constraint(equalToConstant: 0.24 * width).isActive = true
        button.heightAnchor.constraint(equalToConstant: 0.06 * width).isActive = true
        
        return button
    }()
    var productImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Миксик")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 90).isActive = true
        image.heightAnchor.constraint(equalToConstant: 90).isActive = true
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Public
extension BannerCollectionCell {
    func update(_ product: Product) {
        self.product = product
        nameLabel.text = product.title
        priceButton.setTitle("от \(product.price)", for: .normal)
        productImage.image = UIImage(named: product.image)
    }
}
//MARK: - Layout
extension BannerCollectionCell {
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(priceButton)
        containerView.addSubview(productImage)
    }
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(8)
            make.left.right.equalTo(contentView).inset(4)
        }
        productImage.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(containerView).inset(10)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(productImage.snp.right).offset(8)
            make.right.equalTo(containerView).offset(8)
            make.top.equalTo(containerView).offset(20)
        }
        priceButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.left.equalTo(productImage.snp.right).offset(8)
            make.bottom.equalTo(containerView).inset(12)
        }
    }
}

extension BannerCollectionCell {
    @objc func priceButtonTapped() {
        print("onPriceButtonTapped")
        if let product {
            onPriceButtonTapped?(product)
        }
       
    }
}
