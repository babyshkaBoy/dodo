//
//  MenuSections.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 23.09.2023.
//

import UIKit
import SnapKit

class CategoryCell: UITableViewCell {
    
    var categories: [Category] = []
    
    var onCategoryTapped: ((Category) -> ())?
    
    static let reuseId = "CategoryCell"
    
    var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        var view = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.reuseId)
        view.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 3)
        return view
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
extension CategoryCell {
    func update(_ categories: [Category]) {
        self.categories = categories
        collectionView.reloadData()
    }
}
//MARK: - Layout
extension CategoryCell {
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(collectionView)
    }
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        collectionView.snp.makeConstraints { make in
            //make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.top.left.right.bottom.equalTo(containerView).inset(10)
        }
    }
}
//MARK: - UICollectionViewDataSource
extension CategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.reuseId, for: indexPath) as! CategoryCollectionCell
        let category = categories[indexPath.row]
        cell.update(category)
        return cell
    }
}
//MARK: - UICollectionViewDelegate
extension CategoryCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let category = categories[indexPath.row]
        
        onCategoryTapped?(category)
        
    }
}
