//
//  modelProduct.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 08.11.2023.
//

import Foundation

class Product: Codable     {
    //var id: Int
    var title: String
    var description: String
    var size: String?
    var price: Int
    var count: Int
    var image: String
    var ingredients: [Ingredient]?
    var type: String
    var specialOffer: Bool
    
    init(title: String, description: String, size: String? = nil, price: Int, count: Int, image: String, ingredients: [Ingredient], type: String, specialOffer: Bool) {
        //self.id = id
        self.title = title
        self.description = description
        self.size = size
        self.price = price
        self.count = count
        self.image = image
        self.ingredients = ingredients
        self.type = type
        self.specialOffer = specialOffer
    }
}
