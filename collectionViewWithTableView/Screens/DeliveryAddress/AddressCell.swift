//
//  AddressCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 06.12.2023.
//

import UIKit

class AddressCell: UITableViewCell {
    
    static let reuseId = "AddressCell"
    
    let addressLabel: UILabel = {
        let button = UILabel()
        button.text = "ул.Беломорская"
        button.font = .boldSystemFont(ofSize: 16)
        //button.addTarget(nil, action: #selector(addressTapped), for: .touchUpInside)
        //button.titleLabel?.textAlignment = .left
        
        return button
    }()
    
//    let addressButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("ул.Беломорская", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        //button.addTarget(nil, action: #selector(addressTapped), for: .touchUpInside)
//        //button.titleLabel?.textAlignment = .left
//        button.contentHorizontalAlignment = .left
//        return button
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(addressLabel)
    }
    
    private func setupConstraints() {
        addressLabel.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.bottom.equalTo(contentView).inset(8)
        }
    }
    
    func update(_ address: SuggestAddress) {
        //addressButton.setTitle(address.value, for: .normal)
        addressLabel.text = address.value
    }
    
}
