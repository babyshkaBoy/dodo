//
//  Label.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 27.12.2023.
//

import UIKit

class Label: UILabel {
    
    enum LabelStyle {
        case name
        case detail
    }
    
    init(style: LabelStyle) {
        super.init(frame: .zero)
        
        switch style {
            
        case .name:
           makeNameLabel()
        case .detail:
            makeDetailLabel()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeNameLabel() {
        text = "Пицца"
        font = .boldSystemFont(ofSize: 20)
        numberOfLines = 0
    }
    func makeDetailLabel() {
        text = "Состав пиццы"
        textColor = .gray
        numberOfLines = 0
        font = .boldSystemFont(ofSize: 15)
    }
}
