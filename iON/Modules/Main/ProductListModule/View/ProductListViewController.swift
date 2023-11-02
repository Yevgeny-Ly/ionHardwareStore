//
//  ProductListViewController.swift
//  iON
//
//  Created by Евгений Л on 29.09.2023.
//

import UIKit

protocol ProductListViewProtocol: AnyObject {
    // Presenter -> View
    func showProductList(with product: [Product])
}

class ProductListViewController: UIViewController {

    private let tableView = UITableView()
    
    var presenter: ProductListPresenterProtocol?
    var productList = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProductListRouter.createProductListModule(productListRef: self)
        presenter?.viewDidLoad()
        
        setupViews()
        listensNotificationFavoriteToDetailScreen()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        setupDelegates()
        setupTableView()
        setupConstraints()
    }
    
    private func listensNotificationFavoriteToDetailScreen() {
// создаю слушателя нашего NotificationCenter, надо узнать что именно он нам отправил
    NotificationCenter.default.addObserver(self, selector: #selector(updateFavorite), name: NSNotification.Name.updateFavorite, object: nil)
    }
    
    @objc
    private func updateFavorite() {
        presenter?.viewDidLoad()
    }
    
    private func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupTableView() {
        tableView.register(ProductListTableViewCell.self, forCellReuseIdentifier: ProductListTableViewCell.reuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = true
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
}

extension ProductListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductListTableViewCell.reuseIdentifier, for: indexPath) as? ProductListTableViewCell else { return UITableViewCell() }
        let product = productList[indexPath.row]
        
        cell.delegate = self
        cell.configurationCell(with: product, isFavorite: presenter?.checkIsFavorites(iD: product.id) ?? false)
        
        return cell
    }
}

extension ProductListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showProductList(with: productList[indexPath.row], from: self)
    }
}

extension ProductListViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor), 
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProductListViewController: ProductListViewProtocol {
    func showProductList(with product: [Product]) {
        productList = product
        
        tableView.reloadData()
    }
}

extension ProductListViewController: ProductListCellDelegate {
    func setting(favoriteID: String) {
        presenter?.set(favoritesID: favoriteID)
    }
}
