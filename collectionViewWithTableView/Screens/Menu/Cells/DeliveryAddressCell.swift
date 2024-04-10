//
//  adressDeliveryCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 22.11.2023.
//

import UIKit
import SnapKit

class DeliveryAddressCell: UITableViewCell {
    
    static var reuseId = "DeliveryAddressCell"
    
    var onAddressButtonTapped: (()->())?
    
    let containerView: UIView = {
        let view = UIView()
        view.applyShadow(cornerRadius: 8)
        view.backgroundColor = .systemGray.withAlphaComponent(0.2)
        return view
    }()
    var verticalStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        //stackView.alignment = .leading
        //stackView.layer.cornerRadius = 15
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 10, bottom: 8, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    let segmentControl: UISegmentedControl = {
        
        let segment = UISegmentedControl.init(items: ["На доставку", "в зале"])
        segment.heightAnchor.constraint(equalToConstant: 40).isActive = true
        segment.selectedSegmentIndex = 0
        
        return segment
    }()
    
    let separatorView: UIView = {
        let separator = UIView()
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.backgroundColor = .gray
        return separator
    }()
    
    let addressButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitle("Указать адрес доставки", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(addressButtonTapped), for: .touchUpInside)
        
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

extension DeliveryAddressCell {
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(segmentControl)
        verticalStackView.addArrangedSubview(separatorView)
        verticalStackView.addArrangedSubview(addressButton)
        
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.bottom.equalTo(contentView).inset(8)
            
        }
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(containerView)
        }
        
    }
}

extension DeliveryAddressCell {
    @objc func addressButtonTapped() {
        onAddressButtonTapped?()
    }
}
