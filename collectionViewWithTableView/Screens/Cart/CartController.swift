//
//  CartController.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 29.08.2023.
//

import UIKit

enum CartSection: Int, CaseIterable {
    case products = 0
    case totalPrice = 1
}

class CartController: UIViewController {
    var productsArchiver = ProductsArchiver()
    
    lazy var priceHeaderView = PriceHeaderView(frame: CGRect(x: 0,
                                                             y: 0,
                                                             width: view.frame.width,
                                                             height: 60))
    
    var priceButtonView = PriceButtonView(type: .cart)
    
    
    var order: Order = Order(products: [])
    
    lazy var cartTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
                
        tableView.tableHeaderView = priceHeaderView //work only with frames
        tableView.register(OrderProductCell.self, forCellReuseIdentifier: OrderProductCell.reuseId)
        tableView.register(OrderDetailCell.self, forCellReuseIdentifier: OrderDetailCell.reuseId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        update()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadOrderProducts()
        cartTableView.reloadData()
    }
    
    func loadOrderProducts() {
        
        let products = productsArchiver.retrieve()
        
        order = Order(products: products)
    }
    
    private func update() {
        priceHeaderView.update(order.count, price: order.totalPrice)
        
        priceButtonView.update(order.totalPrice)
        
        //3. receive
        priceButtonView.onPriceButtonTapped = { order in
            print(order)
            
        }
        
        cartTableView.reloadData()

    }
}

extension CartController {
    
    func setupViews() {
        view.backgroundColor = .white

        view.addSubview(cartTableView)
        view.addSubview(priceButtonView)

    }
    
    func setupConstraints() {
        cartTableView.snp.makeConstraints { make in
            make.left.right.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(priceButtonView.snp.top)
        }
        priceButtonView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension CartController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return CartSection.allCases.count
        //OrderSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let sectionType = CartSection(rawValue: section) else { return 0 }
        switch sectionType {
                
        case .products:
            return order.products.count
        case .totalPrice:
            return 1
        }
  
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cartSection = CartSection(rawValue: indexPath.section)
        
        switch cartSection {
        case .products:
            let productCell = tableView.dequeueReusableCell(withIdentifier: OrderProductCell.reuseId, for: indexPath) as! OrderProductCell
            
            let product = order.products[indexPath.row]
            productCell.update(product, index: indexPath.row)
            
            //productCell.counterView.addTarget(self, action: #selector(productCountChanged(counter:)), for: .valueChanged)
            
            productCell.counterView.onDecreaseButtonTapped = {
                
                if let product = productCell.product {
                    self.productsArchiver.delete(product)
                    self.order.products = self.productsArchiver.retrieve()
                    self.cartTableView.reloadData()
                }
                
            }
            
            productCell.counterView.onIncreaseButtonTapped = {
                
                if let product = productCell.product {
                    self.productsArchiver.append(product)
                    self.order.products = self.productsArchiver.retrieve()
                    self.cartTableView.reloadData()
                }
            }

            return productCell
            
        case .totalPrice:
            let detailCell = tableView.dequeueReusableCell(withIdentifier: OrderDetailCell.reuseId, for: indexPath) as! OrderDetailCell
            detailCell.update(order.count, price: order.totalPrice)
            return detailCell
            
        default:
            return UITableViewCell()
        }
    }
    
//    @objc func productCountChanged(counter: CounterView) {
//        print(counter.countValue)
//        print(counter.index)
//
//        order.products[counter.index].count = counter.countValue
//
//        if counter.countValue == 0 {
//            order.products.remove(at: counter.index)
//        }
//
//        update()
//    }
}
