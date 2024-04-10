//
//  AddNewAddressCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 05.12.2023.
//

import UIKit
import SnapKit

class AddNewAddressCell: UITableViewCell {
    
    static let reuseId = "AddNewAddressCell"
    var onAddNewAddressTapped: (()->())?
    
    let addNewAddressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить новый адрес", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.addTarget(nil, action: #selector(addNewAddressTapped), for: .touchUpInside)
        //button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(addNewAddressButton)
    }
    
    private func setupConstraints() {
        addNewAddressButton.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.bottom.equalTo(contentView).inset(8)
        }
    }
    
}

extension AddNewAddressCell {
    @objc func addNewAddressTapped() {
        onAddNewAddressTapped?()
    }
}
