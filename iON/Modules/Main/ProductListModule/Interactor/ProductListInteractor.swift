//
//  ProductListInteractor.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

protocol ProductListInputInteractorProtocol: AnyObject {
    var presenter: ProductListOutputInteractorProtocol? { get set }
    // Presenter -> Interactor
    func getProductList()
}

protocol ProductListOutputInteractorProtocol: AnyObject {
    // Interactor -> Presenter
    func productListDidFetch(productList: [Product])
}

class ProductListInteractor: ProductListInputInteractorProtocol {

// т.к. presenter и interactor захватывают друг друга сильными ссылками, надо ослабить ссылку у кого-то одного, чтобы не было цикла сильных ссылок
    weak var presenter: ProductListOutputInteractorProtocol?
     
// создаю функцию где протокол ProductListOutputInteractorProtocol будет брать свою внутренюю функцию productListDidFetch и добавлять модельку ProductList которую настроил для отображения данных
    func getProductList() {
        presenter?.productListDidFetch(productList: getAllProductDetail())
    }

// объеденяю то, что есть в mock данных и в модельке ProductList
    func getAllProductDetail() -> [Product] {
        var product = [Product]()
        let allProductDetail = MockDataProductList.generateDataList()
        for item in allProductDetail {
            product.append(Product(attributes: item))
        }
        return product
    }
}
