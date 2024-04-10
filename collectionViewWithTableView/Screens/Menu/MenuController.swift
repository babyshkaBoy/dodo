//
//  ViewController.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 16.08.2023.
//

import UIKit

enum MenuSection: Int, CaseIterable {
    case addressDelivery = 0
    case banners
    case categories
    case products
}

class MenuController: UIViewController {
    
    //MARK: Properties
    var products: [Product] = []
    var categories: [Category] = []
    
    //MARK: Services
    var productService = ProductService()
    var categoryService = CategoryService()
    private var productArchiver = ProductsArchiver()
    
    lazy var tableView: UITableView = {
        var view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(DeliveryAddressCell.self, forCellReuseIdentifier: DeliveryAddressCell.reuseId)
        view.register(BannerCell.self, forCellReuseIdentifier: BannerCell.reuseId)
        view.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        view.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.reuseId)
        view.register(SpecialOfferCell.self, forCellReuseIdentifier: SpecialOfferCell.reuseId)
        //view.separatorColor = .clear // убирает разделительную линию
        //view.allowsSelection = false
        view.separatorStyle = .none
        view.separatorColor = .clear
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        fetchProducts()
        fetchCategories()
    }
}

//MARK: - Business Logic {
extension MenuController {
    
    func fetchProducts() {
        productService.fetchProducts { products in
            self.products = products
            self.tableView.reloadData()
        }
    }
    
    func fetchCategories() {
        categoryService.fetchCategories { category in
            self.categories = category
            self.tableView.reloadData()
        }
    }
}

//MARK: - Layout
extension MenuController {
    func setupViews(){
        view.addSubview(tableView)
    }
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaInsets)
        }
    }
}

//MARK: - Navigation
extension MenuController {
    func showDetailScreen(_ product: Product) {
        let detailVC = DetailController(product: product)
        self.present(detailVC, animated: true)
    }
}

//MARK: - Event Handler
extension MenuController {
    
    func productCellTapped(_ product: Product) {
        showDetailScreen(product)
    }
}

//MARK: - UITableViewDelegate
extension MenuController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //MenuSection.products.rawValue -> 3
        
        if indexPath.section == MenuSection.products.rawValue {
            let product = products[indexPath.row]
            productCellTapped(product)
        }
        
    }
}

//MARK: - UITableViewDataSource
extension MenuController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return MenuSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionType = MenuSection(rawValue: section)
        
        switch sectionType {
        case .addressDelivery: return 1
        case .banners: return 1
        case .categories: return 1
        case .products: return products.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = MenuSection(rawValue: indexPath.section)
        
        switch section {
        case .banners:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.reuseId, for: indexPath) as! BannerCell
            
            cell.onBannerTapped = { product in //3. Receive
                
                self.showDetailScreen(product)
            }
            print(self.products)
            
            cell.update(products)
            return cell
            
        case .categories:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
            
            cell.onCategoryTapped = { category in
                //print(#line, category)
                let categoryDict: [String: (row: Int, section: Int)] = [
                    "Пицца": (row: 0, section: 3),
                    "Комбо": (row: 6, section: 3),
                    "Закуски": (row: 9, section: 3),
                    "Коктейли": (row: 12, section: 3),
                    "Кофе": (row: 15, section: 3),
                    "Десерты": (row: 18, section: 3),
                    "Напитки": (row: 21, section: 3),
                    "Соусы": (row: 24, section: 3),
                    "Другие товары": (row: 27, section: 3)
                ]
                
                let value = categoryDict[category.name, default: (row: 0, section: 0)]
                
                
                let productSection = value.section
                let row = value.row
                
                self.tableView.scrollToRow(at: IndexPath.init(row: row, section: productSection), at: .top, animated: true)
                
            }
            
            cell.update(categories)
            return cell
            
        case .products:
            
            let product = products[indexPath.row]
            if product.specialOffer == true {
                let cell = tableView.dequeueReusableCell(withIdentifier: SpecialOfferCell.reuseId, for: indexPath) as! SpecialOfferCell
                cell.update(product)
                cell.onButtonTypped = { product in
                    self.productArchiver.append(product)
                    
                }
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
            cell.update(product)
            cell.onButtonTapped = { product in //3. Receive
                //self.showDetailScreen(product)
                self.productArchiver.append(product)
            }
            return cell
            
        case .addressDelivery:
            let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryAddressCell.reuseId, for: indexPath) as! DeliveryAddressCell
            
            cell.onAddressButtonTapped = {
                let deliveryAddressVC = DeliveryAddressController()
                self.present(deliveryAddressVC, animated: true)
            }
            
            
            return cell
            
        default: return UITableViewCell()
        }
    }
}
