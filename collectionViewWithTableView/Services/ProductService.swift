//
//  CartService.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 16.08.2023.
//

import Foundation
import SnapKit

//классы которые поставляют данные

//class Product: Codable     {
//    //var id: Int
//    var title: String
//    var description: String
//    var size: String?
//    var price: Int
//    var count: Int
//    var image: String
//    var ingredients: [Ingredient]
//    var type: String
//    var specialOffer: Bool
//
//    init(title: String, description: String, size: String? = nil, price: Int, count: Int, image: String, ingredients: [Ingredient], type: String, specialOffer: Bool) {
//        //self.id = id
//        self.title = title
//        self.description = description
//        self.size = size
//        self.price = price
//        self.count = count
//        self.image = image
//        self.ingredients = ingredients
//        self.type = type
//        self.specialOffer = specialOffer
//    }
//}

class ProductService {
    var ingredients = [ Ingredient(image: "Красный лук", nameIngredient: "Красный лук", priceIngredient: 59),
                        Ingredient(image: "Бекон", nameIngredient: "Бекон", priceIngredient: 59),
                        Ingredient(image: "Итальянские травы", nameIngredient: "Итальянские травы", priceIngredient: 59),
                        Ingredient(image: "Кубики брынзы", nameIngredient: "Кубики брынзы", priceIngredient: 59),
                        Ingredient(image: "Маринованные огурчики", nameIngredient: "Маринованные огурчики", priceIngredient: 59),
                        Ingredient(image: "Митболы", nameIngredient: "Митболы", priceIngredient: 59),
                        Ingredient(image: "Мортаделла", nameIngredient: "Мортаделла", priceIngredient: 59),
                        Ingredient(image: "Нежный цыпленок", nameIngredient: "Нежный цыпленок", priceIngredient: 59),
                        Ingredient(image: "Острая чоризо", nameIngredient: "Острая чоризо", priceIngredient: 59),
                        Ingredient(image: "Острый халапенью", nameIngredient: "Острый халапенью", priceIngredient: 59),
                        Ingredient(image: "Пикантная пепперони", nameIngredient: "Пикантная пепперони", priceIngredient: 59),
                        Ingredient(image: "Свежие томаты", nameIngredient: "Свежие томаты", priceIngredient: 59),
                        Ingredient(image: "Сладкий перец", nameIngredient: "Сладкий перец", priceIngredient: 59),
                        Ingredient(image: "Сочные ананасы", nameIngredient: "Сочные ананасы", priceIngredient: 59),
                        Ingredient(image: "Сыр блю чиз", nameIngredient: "Сыр блю чиз", priceIngredient: 59),
                        Ingredient(image: "Чеддер и пармезан", nameIngredient: "Чеддер и пармезан", priceIngredient: 59),
                        Ingredient(image: "Шампиньоны", nameIngredient: "Шампиньоны", priceIngredient: 59)
                        
    ]
    
    lazy var products = [
        Product(title: "Пицца Миксик", description: "Пицца с четвертинками с ветчиной, цыплёнком, томатами.", price: 389, count: 1, image: "Миксик", ingredients: self.ingredients, type: "Маленькая 25см, традиционное тесто, 370г", specialOffer: true),
        Product(title: "Пицца Жюльен", description: "Цыплёнок, шампиньоны, сливочный соус с грибами, красный лук, чеснок, моцарелла, смесь сыров чеддер и пармезан.", price: 489, count: 2, image: "Жюльен", ingredients: self.ingredients, type: "Средняя 30см, традиционное тесто, 630г", specialOffer: false),
        Product(title: "Сырная", description: "Моцарелла, чеддер и пармезан.", price: 299, count: 3, image: "Сырная", ingredients: self.ingredients, type: "Средняя 30см, традиционное тесто, 470г", specialOffer: false),
        Product(title: "Пепперони фреш", description: "Пикантная пепперони, томаты и фирменный соус.", price: 299, count: 4, image: "Пепперони", ingredients: self.ingredients, type: "Средняя 30см, традиционное тесто, 590г", specialOffer: false),
        Product(title: "Двойной цыплёнок", description: "Цыплёнок, моцарелла, фирменный соус.", price: 389, count: 5, image: "Двойной цыплёнок", ingredients: self.ingredients, type: "Средняя 30см, традиционное тесто, 520г", specialOffer: false),
        Product(title: "Гавайская", description: "Фирменный соус, цыплёнок, моцарелла и ананасы.", price:  439, count: 6, image: "Гавайская", ingredients: self.ingredients, type: "Средняя 30см, традиционное тесто, 590г", specialOffer: false),
        
        //MARK: - Combo
        Product(title: "3 пиццы", description: "Три удовольствия в нашем меню — это 3 средние пиццы на ваш выбор. Цена комбо зависит от выбранных пицц и может быть увеличена", price: 1099, count: 0, image: "3 пиццы", ingredients: self.ingredients, type: "", specialOffer: true),
        Product(title: "2 додстера", description: "Кручу-верчу, два горячих Додстера хочу! Особенно, если один Классический, а другой — Острый с халапеньо, солеными огурчиками и соусом барбекю в тонкой пшеничной лепешке", price: 319, count: 0, image: "2 додстера", ingredients: self.ingredients, type: "", specialOffer: false),
        Product(title: "2 стартера", description: "Горячая закуска с моцареллой в пшеничной лепешке — это хорошо. А две с разными вкусами — еще лучше. Выберите Грибной с шампиньонами или Сырный с пармезаном и чеддером", price: 329, count: 1, image: "2 стартера", ingredients: self.ingredients, type: "", specialOffer: false),
        
        // MARK: - Snacks
        Product(title: "Дэнвич ветчина и сыр", description: "Поджаристая чиабатта и знакомое сочетание ветчины, цыпленка, моцареллы со свежими томатами, соусом ранч и чесноком", price: 299, count: 0, image: "Дэнвич ветчина и сыр", ingredients: self.ingredients, type: "210г", specialOffer: true),
        Product(title: "Паста мясная", description: "Паста с митболами, соусом бургер, моцареллой, фирменным томатным соусом и чесноком", price: 329, count: 0, image: "Паста мясная", ingredients: self.ingredients, type: "330г", specialOffer: false),
        Product(title: "Картофель из печи", description: "Запеченная в печи картошечка — привычный вкус и мало масла. В составе пряные специи", price: 229, count: 0, image: "Картофель из печи", ingredients: self.ingredients, type: "", specialOffer: false),
        
        // MARK: - Cocktails
        Product(title: "Банановый молочный коктейль, 0,3 л", description: "По-настоящему солнечный! Молочный коктейль с добавлением бананового пюре", price: 199, count: 0, image: "Банановый молочный коктейль", ingredients: self.ingredients, type: "0,3 л", specialOffer: true),
        Product(title: "Карамельное яблоко молочный коктейль, 0,3 л", description: "Уютное сочетание яблочного вкуса, теплой карамели, молока и мороженого в вашем стакане", price: 215, count: 0, image: "Карамельное яблоко молочный коктейль", ingredients: self.ingredients, type: "0,3 л", specialOffer: false),
        Product(title: "Шоколадный молочный коктейль, 0,3 л", description: "Очаровательная шоколадная нежность. Попробуйте молочный коктейль с какао и мороженым", price: 199, count: 0, image: "Шоколадный молочный коктейль", ingredients: self.ingredients, type: "0,3 л", specialOffer: false),
        
        // MARK: - Coffee
        Product(title: "Кофе Американо", description: "Пара глотков горячего Американо, и вы будете готовы покорять этот день", price: 109, count: 0, image: "Кофе Американо", ingredients: self.ingredients, type: "", specialOffer: true),
        Product(title: "Кофе Латте", description: "Когда хочется нежную молочную пенку, на помощь приходит классический латте", price: 129, count: 0, image: "Кофе Латте", ingredients: self.ingredients, type: "", specialOffer: false),
        Product(title: "Кофе Ореховый Латте", description: "Много молока и фундука. Уютный латте на основе эспрессо и орехового сиропа", price: 149, count: 0, image: "Кофе Ореховый Латте", ingredients: self.ingredients, type: "", specialOffer: false),
        
        // MARK: - Dessert
        Product(title: "Брауни", description: "Умножили какао на шоколад и получили изумительный десерт. Вот такая сладкая арифметика", price: 139, count: 0, image: "Брауни", ingredients: self.ingredients, type: "55 г", specialOffer: true),
        Product(title: "Шоколадный кукис", description: "На вид печенье как планета, а на вкус — шоколадная комета с глазурью", price: 59, count: 0, image: "Шоколадный кукис", ingredients: self.ingredients, type: "70 г", specialOffer: false),
        Product(title: "Фондан", description: "Четверо из пяти гостей говорят «Oh la la!», когда едят этот французский десерт с хрустящей корочкой и топленой шоколадной начинкой", price: 309, count: 0, image: "Фондан", ingredients: self.ingredients, type: "", specialOffer: false),
        
        // MARK: - Drinks
        Product(title: "Добрый Кола", description: "", price: 109, count: 0, image: "Добрый Кола", ingredients: self.ingredients, type: "0,5 л", specialOffer: true),
        Product(title: "Добрый Апельсин", description: "", price: 109, count: 0, image: "Добрый Апельсин", ingredients: self.ingredients, type: "0,5 л", specialOffer: false),
        Product(title: "Добрый Лайм - Лимон", description: "", price: 109, count: 0, image: "Добрый Лайм Лимон", ingredients: self.ingredients, type: "0,5 л", specialOffer: false),
        
        // MARK: - Sauces
        Product(title: "Чесночный соус", description: "Фирменный соус с чесночным вкусом для бортиков пиццы и горячих закусок, 25 г", price: 45, count: 0, image: "Чесночный", ingredients: self.ingredients, type: "1 шт", specialOffer: true),
        Product(title: "Барбекю соус", description: "Фирменный соус с дымным ароматом для бортиков пиццы и горячих закусок, 25 г", price: 45, count: 0, image: "Барбекю", ingredients: self.ingredients, type: "1 шт", specialOffer: false),
        Product(title: "Сырный соус", description: "Фирменный соус со вкусом расплавленного сыра для бортиков пиццы и горячих закусок, 25 г", price: 45, count: 0, image: "Сырный", ingredients: self.ingredients, type: "1 шт", specialOffer: false),
        
        // MARK: - Other Goods
        Product(title: "Книга «И ботаники делают бизнес 1+2»", description: "Удивительная история основателя Додо Пиццы — Федора Овчинникова: от провала до миллиона", price: 395, count: 0, image: "Книга", ingredients: self.ingredients, type: "1 шт", specialOffer: true),
        Product(title: "Набор юного садовода", description: "", price: 139, count: 0, image: "Набор", ingredients: self.ingredients, type: "1 шт", specialOffer: false)
        
    ]
}

extension ProductService {
    func fetchProduct() -> [Product] {
        return products
    }

    func fetchProducts(completion: @escaping ([Product])->()) {
    //http://localhost:3001/products
        let session = URLSession.init(configuration: .default)
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "http"
        urlComponents.host = "localhost"
        urlComponents.port = 3001
        urlComponents.path = "/products"
        
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            
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
                let product = try decoder.decode([Product].self, from: data)
                print(Thread.current)
                DispatchQueue.main.async {
                    print(Thread.current)
                    completion(product)
                }
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
}
