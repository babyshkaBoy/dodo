//
//  categoryName.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 23.09.2023.
//

import UIKit
import SnapKit

class CategoryCollectionCell: UICollectionViewCell {
    
    static var reuseId = "CategoryCollectionCell"
    
    var containerView: UIView = {
        var view = UIView()
        //view.backgroundColor = .systemGray6
        //view.layer.cornerRadius = 12
        //view.layer.masksToBounds = true
        view.backgroundColor = .systemBackground
        view.applyShadow(cornerRadius: 12)
        //view.heightAnchor.constraint(equalToConstant: 160).isActive = true
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Пицца"
        label.textColor = .systemGray
        label.textAlignment = .center
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
}
//MARK: - Public
extension CategoryCollectionCell {
    func update(_ category: Category) {
        nameLabel.text = category.name
    }
}
//MARK: - Layout
extension CategoryCollectionCell {
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(nameLabel)
    }
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.right.bottom.top.equalTo(containerView).inset(6)
        }
    }
}
