//
//  ProductListRouter.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

class ProductListRouter: ProductListRouterProtocol {
    
    var presenter: ProductListPresenterProtocol?
    
    func pushToProductDetailProtocol(with productList: Product, from view: UIViewController) {
        let productDetailViewController = ProductDetailViewController()
        NotificationCenter.default.addObserver(self, selector: #selector(updateFavorite), name: NSNotification.Name.updateFavorite, object: nil)
        ProductDetailRouter.createProductDetailModule(with: productDetailViewController, from: productList)
        view.navigationController?.pushViewController(productDetailViewController, animated: true)
    }
    
    @objc
    private func updateFavorite() {
        presenter?.viewDidLoad()
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
