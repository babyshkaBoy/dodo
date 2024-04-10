//
//  header.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 29.08.2023.
//


import UIKit
import SnapKit

final class PriceHeaderView: UIView {
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Товаров на сумму 100 рублей"
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
    private func setupViews() {
        //backgroundColor = .systemMint
        addSubview(priceLabel)
    }
    private func setupConstraints() {
        priceLabel.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(self).inset(20)
        }
    }
    
    func update(_ count: Int, price: Int) {
        priceLabel.text = "\(count) товаров на сумму \(price) руб."
    }
    
}
