//
//  ProductListRouter.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

protocol ProductListRouterProtocol: AnyObject {
    // Present -> Entity
    func pushToProductDetailProtocol(with productList: Product, from view: UIViewController)
    static func createProductListModule(productListRef: ProductListViewController)
}

class ProductListRouter: ProductListRouterProtocol {
    
    func pushToProductDetailProtocol(with productList: Product, from view: UIViewController) {
        let productDetailViewController = ProductDetailViewController()
        ProductDetailRouter.createProductDetailModule(with: productDetailViewController, from: productList)
        view.navigationController?.pushViewController(productDetailViewController, animated: true)
    }
    
    class func createProductListModule(productListRef: ProductListViewController) {
        let presenter: ProductListPresenterProtocol & ProductListOutputInteractorProtocol = ProductListPresenter()
        
        productListRef.presenter = presenter
        productListRef.presenter?.router = ProductListRouter()
        productListRef.presenter?.view = productListRef
        productListRef.presenter?.interactor = ProductListInteractor()
        productListRef.presenter?.interactor?.presenter = presenter
    }
}
