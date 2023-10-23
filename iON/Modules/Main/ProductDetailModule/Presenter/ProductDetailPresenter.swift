//
//  ProductDetailPresenter.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

class ProductDetailPresenter: ProductDetailPresenterProtocol {
    
    weak var view: ProductDetailViewProtocol?
    var router: ProductDetailRouterProtocol?
    var interactor: ProductDetailInputInteractorProtocol?
    
    var favoriteDataManager = FavoriteDataManager.shared
    
    var product: Product?
    
    func viewDidLoad() {
        view?.showProductDetail(with: product ?? Product(attributes: ["" : ""]))
    }
    
    func loadDetailProduct() {
        interactor?.getProductId()
    }
}

extension ProductDetailPresenter: ProductDetailOutputInteractorProtocol {
    
    func productIdDidFetchDetail(productID: Product) {
    }
    
    func set(favoriteID: String) {
        
        var items = favoriteDataManager.get()
        if items.contains(favoriteID) {
            items.remove(favoriteID)
        } else {
            items.insert(favoriteID)
        }
        favoriteDataManager.save(items: items) // сохранение состояния избранного
        
// теперь надо отправить событие, которое говорит, что наши данные обновились
        NotificationCenter.default.post(name: NSNotification.Name.updateFavorite, object: nil)
    }
    
    func checkIsFavorite(id: String) -> Bool {
        return favoriteDataManager.get().contains(id)
    }
}
