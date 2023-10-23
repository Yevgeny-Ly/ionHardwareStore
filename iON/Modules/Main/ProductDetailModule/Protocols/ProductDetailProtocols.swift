//
//  ProductDetailProtocol.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

protocol ProductDetailPresenterProtocol: AnyObject {
    // View -> Presenter
    var interactor: ProductDetailInputInteractorProtocol? { get set }
    var view: ProductDetailViewProtocol? { get set }
    var router: ProductDetailRouterProtocol? { get set }
    
    func viewDidLoad()
     
    var product: Product? { get set } // передаю в presenter свою модель с данными
    func set(favoriteID: String)
    func checkIsFavorite(id: String) -> Bool // проверяю каждую ячеку является ли она избранной
}

protocol ProductDetailViewProtocol: AnyObject {
    // Presenter -> View
    func showProductDetail(with product: Product)
}

protocol ProductDetailInputInteractorProtocol: AnyObject {
    var presenter: ProductDetailOutputInteractorProtocol? { get set }
    // Presenter -> Interactor
    func getProductId()
}

protocol ProductDetailOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
    func productIdDidFetchDetail(productID: Product)
}

protocol ProductDetailRouterProtocol: AnyObject {
    // Present -> Entity
    func goBackToProductListView(from view: UIViewController)
}
