//
//  CategoryService.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 23.09.2023.
//

import UIKit

//class Category: Codable {
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//}

class CategoryService {
    lazy var category = [
        Category(name: "Пицца"),
        Category(name: "Комбо"),
        Category(name: "Закуски"),
        Category(name: "Коктейли"),
        Category(name: "Кофе"),
        Category(name: "Десерты"),
        Category(name: "Напитки"),
        Category(name: "Соусы"),
        Category(name: "Другие товары")
    ]
}

extension CategoryService {
    func fetchCategory() -> [Category] {
        return category
    }
    func fetchCategories(completion: @escaping ([Category])->()) {
        //http://localhost:3001/categories
        
        let session = URLSession(configuration: .default)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "localhost"
        urlComponents.port = 3001
        urlComponents.path = "/categories"
        
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let tasks = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200..<300:
                    print("Success Status: \(response.statusCode)")
                    break
                default:
                    print("Status: \(response.statusCode)")
                }
            }
            
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let category = try decoder.decode([Category].self, from: data)
                DispatchQueue.main.async {
                    print(Thread.current)
                    completion(category)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
