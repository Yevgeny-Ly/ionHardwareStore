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
        self.viewControllers = [mainViewController(), basketViewController(), catalogViewController(), profileViewController()]
    }
    
    func mainViewController() -> UINavigationController {
        let mainVC = ProductListViewController()
        mainVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))

        return UINavigationController(rootViewController: mainVC)
    }
    
    func basketViewController() -> UINavigationController {
        let basketVC = BasketViewController()
        basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "basket"), selectedImage: UIImage(systemName: "basket.fill"))
        
        return UINavigationController(rootViewController: basketVC)
    }
    
    func catalogViewController() -> UINavigationController {
        let favoritesVC = СatalogViewController()
        favoritesVC.tabBarItem = UITabBarItem(title: "Каталог", image: UIImage(systemName: "waveform.and.magnifyingglass"), selectedImage: UIImage(systemName: "waveform.and.magnifyingglass"))
        
        return UINavigationController(rootViewController: favoritesVC)
    }
    
    func profileViewController() -> UINavigationController {
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        return UINavigationController(rootViewController: profileVC)
    }
}
