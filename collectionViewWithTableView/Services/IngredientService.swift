//
//  IngridientService.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 05.09.2023.
//

import UIKit

//class Ingredient: Codable {
//    var image: String
//    var nameIngredient: String
//    var priceIngredient: Int
//    
//    init(image: String, nameIngredient: String, priceIngredient: Int) {
//        self.image = image
//        self.nameIngredient = nameIngredient
//        self.priceIngredient = priceIngredient
//    }
//}

class IngridientService {
    let ingridients = [
        Ingredient(image: "cream cheese", nameIngredient: "Сливочный сыр", priceIngredient: 79),
        Ingredient(image: "red onion", nameIngredient: "Красный лук", priceIngredient: 59),
        Ingredient(image: "Шампиньоны", nameIngredient: "Шампиньоны", priceIngredient: 59)
    ]
}
