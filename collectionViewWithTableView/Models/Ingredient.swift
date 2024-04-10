//
//  Ingredient.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 08.11.2023.
//

import Foundation

class Ingredient: Codable {
    var image: String
    var nameIngredient: String
    var priceIngredient: Int
    
    init(image: String, nameIngredient: String, priceIngredient: Int) {
        self.image = image
        self.nameIngredient = nameIngredient
        self.priceIngredient = priceIngredient
    }
}
