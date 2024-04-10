//
//  SpecialOffer.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 04.10.2023.
//

import UIKit
import SnapKit

class SpecialOfferCell: UITableViewCell {
    
    static let reuseId = "SpecialOffer"
    
    var product: Product?
    var onButtonTypped: ((Product)->())?
    
    let buttonStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    let verticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        //stackView.spacing = 12
        //stackView.alignment = .leading
        
       return stackView
    }()
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Банановый молочный коктейль")
        let screenWidth = UIScreen.main.bounds.width
        imageView.heightAnchor.constraint(equalToConstant: 0.6 * screenWidth).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 0.6 * screenWidth).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    let containerView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.applyShadow(cornerRadius: 8)
        
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 270).isActive = true
       return view
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Банановый молочный коктейль"
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
       return label
    }()
    let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Молочный коктейль с добавлением бананового пюре"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    let priceButton: UIButton = {
       let button = UIButton()
        button.setTitle("215 р", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = .orange.withAlphaComponent(0.3)
        button.applyShadow(cornerRadius: 12)
        button.addTarget(nil, action: #selector(priceButtonTapped), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(containerView)
        contentView.addSubview(verticalStackView)
        //contentView.addSubview(buttonStackView)
       
        verticalStackView.addArrangedSubview(productImageView)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        buttonStackView.addArrangedSubview(priceButton)
        verticalStackView.addArrangedSubview(buttonStackView)
    }
    func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(20)
        }
        containerView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.bottom.equalTo(contentView).inset(8)
        }
    }
    
    func update(_ product: Product) {
        self.product = product
        productImageView.image = UIImage(named: product.image)
        nameLabel.text = product.title
        descriptionLabel.text = product.description
        priceButton.setTitle("\(product.price)", for: .normal)
    }
}

extension SpecialOfferCell {
    @objc func priceButtonTapped(sender: UIButton) {
        guard let product = product else { return }
        onButtonTypped?(product)
    }
}
