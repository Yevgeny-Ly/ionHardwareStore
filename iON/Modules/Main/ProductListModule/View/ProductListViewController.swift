//
//  ProductListViewController.swift
//  iON
//
//  Created by Евгений Л on 29.09.2023.
//

import UIKit 

class ProductListViewController: UIViewController {
    
    private let tableView = UITableView()
    lazy var searchBar = UISearchBar()
    
    var presenter: ProductListPresenterProtocol?
    var productList = [Product]()
    
    lazy private var locationButtonForItem: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(pressButtonLocationItem), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProductListRouter.createProductListModule(productListRef: self)
        presenter?.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        setupNavigationController()
        setupSearchBar()
        listensNotificationFavoriteToDetailScreen()
        setupDelegates()
        setupTableView()
        setupConstraints()
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .white
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = "Найти технику"
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Вся техника", "Избранное"]
        
        navigationItem.titleView = searchBar
    }
    
    private func listensNotificationFavoriteToDetailScreen() {
        // создаю слушателя нашего NotificationCenter, надо узнать что именно он нам отправил
        NotificationCenter.default.addObserver(self, selector: #selector(updateFavorite), name: NSNotification.Name.updateFavorite, object: nil)
    }

    @objc
    private func updateFavorite() {
        print("update Favorite")
        presenter?.viewDidLoad()
    }
    
    private func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
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
    
    @objc
    private func pressButtonLocationItem() {
        print("Press Button Location Item")
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
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 7),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -7),
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

extension ProductListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
}

// когда нажата "отмена" на панели поиска
extension ProductListViewController: UISearchControllerDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
}

// для самого поля поиска.
extension ProductListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}
