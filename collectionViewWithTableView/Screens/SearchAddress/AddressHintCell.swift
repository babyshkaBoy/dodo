//
//  AddressHintCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 13.12.2023.
//

import UIKit
import SnapKit

class AddressHintCell: UITableViewCell {
    
    static let reuseId = "AddressHintCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Какая та улица"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Торговый центр"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let verticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        
        
       return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ address: SuggestAddress) {
        titleLabel.text = address.value
    }
}

private extension AddressHintCell {
    func setupViews() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
    }
    func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(14)
        }
    }
}
