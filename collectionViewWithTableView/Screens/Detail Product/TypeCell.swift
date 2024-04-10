//
//  TypeCell.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 05.09.2023.
//

import UIKit

class TypeCell: UITableViewCell {
    static let reuseId = "TypeCell"
    
    let verticalStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.directionalLayoutMargins = .init(top: 10, leading: 12, bottom: 10, trailing: 12)
        stackView.isLayoutMarginsRelativeArrangement = true
        //stackView.alignment = .center
        stackView.distribution = .fill
       return stackView
    }()
    
    lazy var sizeSegment: UISegmentedControl = {
        
        let segment = UISegmentedControl.init(items: ["Маленькая", "Средняя", "Большая"])
        segment.addTarget(self, action: #selector(sizeSegmentChanged(sender:)), for: .valueChanged)
        segment.selectedSegmentIndex = 1
        return segment
    }()
    
    lazy var typeSegment: UISegmentedControl = {
       let segment = UISegmentedControl(items: ["Традиционная", "Тонкая"])
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(typeSegmentChanged(sender:)), for: .valueChanged)
        return segment
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ product: Product) {
        
    }
    
    @objc func sizeSegmentChanged(sender: UISegmentedControl) {
        
        print(sender)
    }
    
    @objc func typeSegmentChanged(sender: UISegmentedControl) {
        print(sender)
    }
}

//MARK: - Layout
extension TypeCell {
    func setupViews() {
        contentView.addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(sizeSegment)
        verticalStack.addArrangedSubview(typeSegment)
    }
    func setupConstraints() {
        verticalStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
