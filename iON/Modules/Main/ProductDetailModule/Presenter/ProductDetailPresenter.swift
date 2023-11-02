//
//  ProductDetailPresenter.swift
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
    var isFavotiteItem: Bool? { get set }

    func viewDidLoad()

    var product: Product? { get set } // передаю в presenter свою модель с данными
    func set(favoriteID: String)
    func checkIsFavorite(id: String) -> Bool // проверяю каждую ячеку является ли она избранной
    
}

class ProductDetailPresenter: ProductDetailPresenterProtocol {
    
    weak var view: ProductDetailViewProtocol?
    var router: ProductDetailRouterProtocol?
    var interactor: ProductDetailInputInteractorProtocol?
    var isFavotiteItem: Bool?
    
    var favoriteDataManager = FavoriteDataManager.shared
    
    var product: Product?
    
    func viewDidLoad() {
        view?.showProductDetail(with: product ?? Product(attributes: ["" : ""]))
        isFavotiteItem = checkIsFavorite(id: product?.id ?? "")
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
<<<<<<< Updated upstream
        
// теперь надо отправить событие, которое говорит, что наши данные обновились
        NotificationCenter.default.post(name: NSNotification.Name.updateFavorite, object: nil)
=======
>>>>>>> Stashed changes
    }
    
    func checkIsFavorite(id: String) -> Bool {
        return favoriteDataManager.get().contains(id)
    }
}
