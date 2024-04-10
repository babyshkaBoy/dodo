//
//  Order.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 08.11.2023.
//

import Foundation

class Order {
    var products: [Product]
    
    var totalPrice: Int {
        var result = 0
        for product in products {
            result += product.count * product.price
        }
        return result
    }
   
    var count: Int {
        var result = 0
        for product in products {
            result += product.count
        }
        return result
    }
    
    init(products: [Product]) {
        self.products = products
    }
}
