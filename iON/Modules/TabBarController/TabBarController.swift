//
//  MainTabBarController.swift
//  iON
//
//  Created by Евгений Л on 13.10.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        UITabBar.appearance().tintColor = .black
        self.viewControllers = [mainViewController(), basketViewController(), favoritesViewController(), profileViewController()]
    }
    
    func mainViewController() -> UINavigationController {
        let mainVC = ProductListViewController()
        mainVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))

        return UINavigationController(rootViewController: mainVC)
    }
    
    func basketViewController() -> UINavigationController {
        let basketVC = BasketViewController()
        basketVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "basket"), selectedImage: UIImage(systemName: "basket.fill"))
        
        return UINavigationController(rootViewController: basketVC)
    }
    
    func favoritesViewController() -> UINavigationController {
        let favoritesVC = FavoritesViewController()
        favoritesVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        return UINavigationController(rootViewController: favoritesVC)
    }
    
    func profileViewController() -> UINavigationController {
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        return UINavigationController(rootViewController: profileVC)
    }
}
