//
//  DetailCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 05.09.2023.
//

import UIKit
import SnapKit

class DetailCell: UITableViewCell {
    
    static let reuseId = "DetailCell"
    
    let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    let productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Красный лук")
        image.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.9 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.9 * width).isActive = true

        return image
    }()
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Трюфельная с мортаделлой"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    let productDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "Средняя 30 см, традиционное тесто, 620 г"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Фирменный соус, моцарелла, мортаделла, красный лук, шампиньоны, чеснок"
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 0
        return label
    }()
    let removeIngredientsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Убрать ингредиенты", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Public
extension DetailCell {
    func update(_ product: Product) {
        productImage.image = UIImage(named: product.image)
        productNameLabel.text = product.title
        productDetailLabel.text = product.type
        productDescriptionLabel.text = product.description
    }
}
//MARK: - Layout
extension DetailCell {
    func setupViews() {
        contentView.addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(productImage)
        verticalStack.addArrangedSubview(productNameLabel)
        verticalStack.addArrangedSubview(productDetailLabel)
        verticalStack.addArrangedSubview(productDescriptionLabel)
        verticalStack.addArrangedSubview(removeIngredientsButton)
    }
    func setupConstraints() {
        verticalStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
