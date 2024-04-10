//
//  IngridientCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 05.09.2023.
//

import UIKit
import SnapKit

class IngredientCell: UITableViewCell {
    
    var ingredients: [Ingredient] = []
    
    static let reuseId = "IngridientCell"
    
    var heightConstraint: NSLayoutConstraint?
    
    let addIngredientLabel: UILabel = {
       let label = UILabel()
        label.text = "Добавить по вкусу"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: Screen.width * 0.28,
                                height: Screen.width * 0.4)
        layout.sectionInset = UIEdgeInsets(top: 4,
                                           left: 4,
                                           bottom: 4,
                                           right: 4)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        
        
        //collectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(IngredientCollectionCell.self, forCellWithReuseIdentifier: IngredientCollectionCell.reuseId)

        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ ingredients: [Ingredient]) {
        self.ingredients = ingredients
        collectionView.reloadData()
        
        var rowCount = Float(ingredients.count) / 3
        
        //4/3 = 1.(3) -> 2.0
        
        rowCount.round(.up)
        
        let rowHeight = Float(Screen.width * 0.43)
        var height = CGFloat(rowCount * rowHeight) + 40
        
        
        //collectionView.layoutIfNeeded()
        //var height = self.collectionView.collectionViewLayout.collectionViewContentSize.height
        print("->", height)
        
        collectionView.heightAnchor.constraint(equalToConstant: height).isActive = true
        //self.heightContraint.constant = height
        //self.contentView.layoutIfNeeded()
    }
}
//MARK: - Layout
extension IngredientCell {
    func setupViews(){
        contentView.addSubview(addIngredientLabel)
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        addIngredientLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.top.equalTo(contentView).offset(8)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(addIngredientLabel.snp.bottom).offset(8)
            make.left.right.bottom.equalTo(contentView).inset(10)
        }
    }
}

extension IngredientCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientCollectionCell.reuseId, for: indexPath) as! IngredientCollectionCell
        let ingredients = ingredients[indexPath.row]
        cell.update(ingredients)
        return cell
    }
}
