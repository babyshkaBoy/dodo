//
//  TabBar.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 29.08.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private var menuVC: MenuController = {
        let controller = MenuController()
        let image = UIImage(systemName: "menucard")
        let selectedImage = UIImage(systemName: "menucard.fill")
        let tabItem = UITabBarItem(title: "Меню", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem //
        return controller
    }()
    
    private var cartVC: CartController = {
        let controller = CartController()
        let image = UIImage(systemName: "cart")
        let selectedImage = UIImage(systemName: "cart.fill")
        let tabItem = UITabBarItem(title: "Корзина", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
       
        CoreDataManager.shared.createUser("Беломорская 11", fullname: "Baev Azamat", phone: "+7988876543")
        
    }
    private func setup() {
        tabBar.tintColor = .lightGray
        viewControllers = [menuVC, cartVC]
    }
    
}
