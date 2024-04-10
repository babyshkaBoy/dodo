//
//  OrderService.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 29.08.2023.
//

import UIKit


class OrderService {
    
    let ingredients1 = [Ingredient(image: "Шампиньоны", nameIngredient: "Шампиньоны", priceIngredient: 70)]
    lazy var product1 = Product(title: "Пепперони фреш", description: "Пикантная пепперони, томаты и фирменный соус.", price: 299, count: 4, image: "Пепперони", ingredients: ingredients1, type: "pizza", specialOffer: false)
    
    lazy var order = Order(products: [
        product1,
        Product(title: "Двойной цыплёнок", description: "Цыплёнок, моцарелла, фирменный соус.", price: 389, count: 5, image: "Двойной цыплёнок", ingredients: [Ingredient(image: "Бекон", nameIngredient: "Бекон", priceIngredient: 79)], type: "pizza", specialOffer: false),
        Product(title: "Гавайская", description: "Фирменный соус, цыплёнок, моцарелла и ананасы.", price:  439, count: 6, image: "Гавайская", ingredients: [Ingredient(image: "Мортаделла", nameIngredient: "Мортаделла", priceIngredient: 59)], type: "pizza", specialOffer: false)
    ])
}

