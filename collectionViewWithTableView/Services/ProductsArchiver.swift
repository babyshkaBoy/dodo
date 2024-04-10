//
//  ProductsArchiver.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 01.11.2023.
//

import Foundation

protocol ProductsArchiverInput {
    /// сохраняем
    func save(_ products: [Product])
    /// получаем массив
    func retrieve() -> [Product]
}

final class ProductsArchiver: ProductsArchiverInput {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let userDefaults = UserDefaults.standard
    
    private let key = "Products"
    
    
    func delete(_ product: Product) {
        var products = retrieve()
        for (index, item) in products.enumerated() {
            
            if item.title == product.title  {
                
                if item.count == 1 {
                    products.remove(at: index)
                    save(products)
                    return
                }
                
                if item.count > 1 {
                    products[index].count -= 1
                    save(products)
                    return
                }
                
            }
        }
    }
    
    func append(_ product: Product) {
        
        var products = retrieve()
        for (index, item) in products.enumerated() {
            
            if item.title == product.title {
                products[index].count += 1
                save(products)
                return
            }
        }
        
        products.append(product)
        save(products)
    }
    
    func save(_ products: [Product]) {
        do {
            let data = try encoder.encode(products)
            userDefaults.set(data, forKey: key)
        } catch {
           print(error)
        }
    }
    func retrieve() -> [Product] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        do {
            let array = try decoder.decode(Array<Product>.self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
    
}
