//
//  BannerCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 19.08.2023.
//

import UIKit
import SnapKit


class BannerCell: UITableViewCell {
    
    var products: [Product] = []
    
    var onBannerTapped: ((Product)->())? //1. Init
    
    static var reuseId = "BannerCell"
    
    var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.heightAnchor.constraint(equalToConstant: 192).isActive = true
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Выгодно и вкусно"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: Screen.width * 0.65,
                                height: Screen.width * 0.35)
        var view = UICollectionView(frame: .zero,
                                    collectionViewLayout: layout)
        
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        view.register(BannerCollectionCell.self, forCellWithReuseIdentifier: BannerCollectionCell.reuseId)
        view.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
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
    func update(_ products: [Product]) {
        self.products = products
        collectionView.reloadData()
    }
}
//MARK: - Layout
extension BannerCell {
    func setupViews(){
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(collectionView)
    }
    func setupConstraints(){
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalTo(containerView).inset(15)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.right.bottom.equalTo(containerView)
        }
    }
}
//MARK: - UICollectionViewDataSource
extension BannerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if products.count <= 6 {
            return products.count
        } else {
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionCell.reuseId,
                                                      for: indexPath) as! BannerCollectionCell
        let product = products[indexPath.row]
        cell.update(product)
        
        cell.onPriceButtonTapped = { product in
            //if let product = product {
            self.onBannerTapped?(product)
            //}
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension BannerCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let product = products[indexPath.row]
        
        onBannerTapped?(product) //Call
        
    }
}


