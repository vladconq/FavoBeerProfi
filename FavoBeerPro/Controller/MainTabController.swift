//
//  MainTabController.swift
//  FavoBeerPro
//
//  Created by Vladislav on 15.08.2021.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    // MARK: - Helpers
    
    func configureViewControllers() {
        let allBeersController = UINavigationController(rootViewController: AllBeersController())
        let favoriteBeersController = UINavigationController(rootViewController: FavoriteBeersController())
        
        allBeersController.tabBarItem = UITabBarItem(title: "All beers", image: nil, selectedImage: nil)
        allBeersController.tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 13)], for: .normal)
        
        favoriteBeersController.tabBarItem = UITabBarItem(title: "Favorites", image: nil, selectedImage: nil)
        favoriteBeersController.tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 13)], for: .normal)
        
        viewControllers = [allBeersController, favoriteBeersController]
    }
    
}
