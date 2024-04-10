//
//  DetailVC.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 05.09.2023.
//

import UIKit
import SnapKit

enum DetailSection: Int, CaseIterable {
    case detail = 0
    case types
    case ingredients
}

class DetailController: UIViewController {
    
    
    //MARK: Properties
    var ingredients: [Ingredient] = []
    var product: Product
    
    
    //MARK: Services
    var productsArchiver = ProductsArchiver()
    
    var priceButtonView = PriceButtonView(type: .detail)
    
    
    //MARK: Lifecycle
    init(product: Product) {
        self.product = product
        //self.ingredients = product.ingredients
        
        super.init(nibName: nil, bundle: nil)
        //tableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        //tableView.allowsSelection = false // отключение тапа
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(DetailCell.self, forCellReuseIdentifier: DetailCell.reuseId)
        tableView.register(TypeCell.self, forCellReuseIdentifier: TypeCell.reuseId)
        tableView.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.reuseId)
        //tableView.separatorColor = .white
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        update()
    }
    
}
extension DetailController {
    func update() {
        priceButtonView.update(product)
        
        priceButtonView.onPriceButtonTapped = { product in
            print("->",product)
            
            guard let product = product else { return }
            
            self.productsArchiver.append(product)
            
            self.dismiss(animated: true)

        }
    }
}


//MARK: - Layout
extension DetailController {
    func setupViews() {
        view.addSubview(tableView)
        view.addSubview(priceButtonView)
    }
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        priceButtonView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}
//MARK: - UITableViewDelegate
extension DetailController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailSection.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
//MARK: - UITableViewDataSource
extension DetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = DetailSection(rawValue: indexPath.section) // <- 0, 1, 2
        // -> .detail, .types, .ingredients
        switch section {
        case .detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.reuseId, for: indexPath) as! DetailCell
            cell.update(product)
            return cell
            
        case .types:
            let cell = tableView.dequeueReusableCell(withIdentifier: TypeCell.reuseId, for: indexPath) as! TypeCell
            return cell
            
        case .ingredients:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.reuseId, for: indexPath) as! IngredientCell
            cell.update(ingredients)
            return cell
        default: return UITableViewCell()
        }
    }
}
