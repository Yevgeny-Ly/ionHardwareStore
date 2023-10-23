//
//  ProductListProtocol.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

protocol ProductListViewProtocol: AnyObject {
    // Presenter -> View
    func showProductList(with product: [Product])
}

protocol ProductListPresenterProtocol: AnyObject {
    // View -> Presenter
    var interactor: ProductListInputInteractorProtocol? { get set }
    var view: ProductListViewProtocol? { get set }
    var router: ProductListRouterProtocol? { get set }
    
    func viewDidLoad() 
    func showProductList(with productList: Product, from view: UIViewController)
    
    func set(favoritesID: String) // передавать id который будет отвечать за сохранение
    func checkIsFavorites(iD: String) -> Bool // проверяет есть ли данное id в избранном или нет
}

protocol ProductListInputInteractorProtocol: AnyObject {
    var presenter: ProductListOutputInteractorProtocol? { get set }
    // Presenter -> Interactor
    func getProductList()
}

protocol ProductListOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
    func productListDidFetch(productList: [Product]) 
}

protocol ProductListRouterProtocol: AnyObject {
    // Present -> Entity
    func pushToProductDetailProtocol(with productList: Product, from view: UIViewController)
    static func createProductListModule(productListRef: ProductListViewController)
}
