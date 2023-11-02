//
//  ProductListPresenter.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

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

class ProductListPresenter: ProductListPresenterProtocol {
    
    weak var view: ProductListViewProtocol?
    var router: ProductListRouterProtocol?
    var interactor: ProductListInputInteractorProtocol?
    
    var favoriteDataManager = FavoriteDataManager.shared
    
//    var product: Product?
    
    func showProductList(with productList: Product, from view: UIViewController) {
        router?.pushToProductDetailProtocol(with: productList, from: view) 
    }
    
    func viewDidLoad() {
        self.loadProductList()
    }
    
    func loadProductList() {
        interactor?.getProductList()
    }
}
    
extension ProductListPresenter : ProductListOutputInteractorProtocol {
    
    func productListDidFetch(productList: [Product]) {
        view?.showProductList(with: productList)
    }
    
    func set(favoritesID: String) {
        var items = favoriteDataManager.get() // вызываю все id с избранными товарами
    
        if items.contains(favoritesID) { // смотрю есть ли данный id в избранном
            items.remove(favoritesID) // если нажата кнопка на избранное, то удаляю его
        } else {
            items.insert(favoritesID) // если не установлена, то добавляю в избранное
        }
        favoriteDataManager.save(items: items) // сохраняю все изменения в UserDefaults
        
        NotificationCenter.default.post(name: NSNotification.Name.updateFavorite, object: nil)
    }
    
// функция отвечает за просмотр состояния избранного (нажата на избранное или нет)
    func checkIsFavorites(iD: String) -> Bool {
        return favoriteDataManager.get().contains(iD) // проверяю есть ли эти id товары в избранном или нет
    }
}

