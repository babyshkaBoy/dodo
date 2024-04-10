//
//  IngredientCollectionCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 17.10.2023.
//

import UIKit

class IngredientCollectionCell: UICollectionViewCell {
    static let reuseId = "CollectionCell"
    
    var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.applyShadow(cornerRadius: 8)
        view.backgroundColor = .systemBackground
        
        //view.heightAnchor.constraint(equalToConstant: 160).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let verticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        //stackView.spacing = 6
        //stackView.directionalLayoutMargins = .init(top: 10, leading: 12, bottom: 10, trailing: 12)
        //stackView.isLayoutMarginsRelativeArrangement = true
        stackView.distribution = .equalSpacing
        return stackView
    }()
    let ingredientImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "red onion")
        view.contentMode = .scaleAspectFit
        let width = UIScreen.main.bounds.width
        view.heightAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
        view.widthAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
        return view
    }()
    let ingredientNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Сливочный сыр"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    let priceIngredientLabel: UILabel = {
       let label = UILabel()
        label.text = "59 руб"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func update(_ ingredient: Ingredient) {
        
        ingredientNameLabel.text = ingredient.nameIngredient
        ingredientImageView.image = UIImage(named: "\(ingredient.image)")
        priceIngredientLabel.text = "\(ingredient.priceIngredient)"
        
    }
}

//MARK: - Layout
extension IngredientCollectionCell {
    func setupViews(){
        contentView.addSubview(containerView)
        containerView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(ingredientImageView)
        verticalStackView.addArrangedSubview(ingredientNameLabel)
        verticalStackView.addArrangedSubview(priceIngredientLabel)
    }
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView)
            make.left.right.equalTo(contentView)
        }
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(containerView)
        }
    }
}
