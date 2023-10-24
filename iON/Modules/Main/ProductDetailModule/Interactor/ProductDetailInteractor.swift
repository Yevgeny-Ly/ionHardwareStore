//
//  ProductDetailInteractor.swift
//  iON
//
//  Created by Евгений Л on 13.10.2023.
//

import UIKit

protocol ProductDetailInputInteractorProtocol: AnyObject {
    var presenter: ProductDetailOutputInteractorProtocol? { get set }
    // Presenter -> Interactor
    func getProductId()
}

protocol ProductDetailOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
    func productIdDidFetchDetail(productID: Product)
}

class ProductDetailInteractor: ProductDetailInputInteractorProtocol {
    
    weak var presenter: ProductDetailOutputInteractorProtocol?
    
    func getProductId() {
    }
}
