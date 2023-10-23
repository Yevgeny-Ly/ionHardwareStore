//
//  ProductDetailRouter.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

class ProductDetailRouter: ProductDetailRouterProtocol {
    
    class func createProductDetailModule(with productDetailRef: ProductDetailViewController, from product: Product) {
        let presenter = ProductDetailPresenter()
        presenter.product = product
        productDetailRef.presenter = presenter
        productDetailRef.presenter?.view = productDetailRef
        productDetailRef.presenter?.router = ProductDetailRouter()
    }
    
    func goBackToProductListView(from view: UIViewController) {
    }
}
