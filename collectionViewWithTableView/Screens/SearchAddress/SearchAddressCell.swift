//
//  SearchAddressCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 06.12.2023.
//

import UIKit
import SnapKit

class SearchAddressCell: UITableViewCell {
    
    static let reuseId = "SearchAddressCell"
    
    var onTextFieldChanged: ((String)->())?
    
    private let deliveryAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Адрес доставки"
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    let searchAddressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ваш адрес доставки"
        textField.font = .systemFont(ofSize: 20)
        textField.widthAnchor.constraint(equalToConstant: 160).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.addTarget(nil, action: #selector(textFieldChange(_:)), for: .editingChanged)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.tintColor = .gray
        return textField
    }()
    let selectOnTheMapButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать на карте", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(selectOnTheMapButtonTapped), for: .touchUpInside)
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
//
//extension SearchAddressCell {
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        searchAddressTextField.becomeFirstResponder()
//    }
//}

extension SearchAddressCell {
    @objc func selectOnTheMapButtonTapped() {
        print("select button map")
    }
    @objc func textFieldChange(_ sender: UITextField) {
        print("sender of text", sender.text)
        
        onTextFieldChanged?(sender.text ?? "")
    }
}


private extension SearchAddressCell {
    func setupViews() {
        contentView.addSubview(deliveryAddressLabel)
        contentView.addSubview(selectOnTheMapButton)
        contentView.addSubview(searchAddressTextField)
    }
    func setupConstraints() {
        deliveryAddressLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(12)
            make.left.equalTo(contentView).offset(6)
        }
        searchAddressTextField.snp.makeConstraints { make in
            make.top.equalTo(deliveryAddressLabel.snp.bottom).offset(10)
            make.left.right.equalTo(contentView).inset(6)

        }
        selectOnTheMapButton.snp.makeConstraints { make in
            make.top.equalTo(searchAddressTextField.snp.bottom).offset(50)
            make.left.equalTo(contentView).offset(6)
            make.bottom.equalTo(contentView).inset(8)
        }
    }
}
