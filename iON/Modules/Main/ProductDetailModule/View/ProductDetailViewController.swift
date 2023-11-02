//
//  ProductDetailViewController.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

protocol ProductDetailViewProtocol: AnyObject {
    // Presenter -> View
    func showProductDetail(with product: Product)
}

class ProductDetailViewController: UIViewController {
    
    var presenter: ProductDetailPresenterProtocol?
    
    private var statusIsFavoriteButton = false
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var costBlockStackView = UIStackView()
    
    private var productCostLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .robotoMedium20()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let productOldCostLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialGrey
        label.font = .robotoMedium14()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var productNameAndDescriptionStackView = UIStackView()
    
    private var productNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .robotoBold20()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .robotoMedium14()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var favoriteButtonForItem: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray
        button.addTarget(self, action: #selector(tapButtonFavoritesСommodity), for: .touchUpInside)
        return button
    }()

    lazy var favoriteBarButton = UIBarButtonItem(customView: favoriteButtonForItem)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.viewDidLoad()
        
        statusIsFavoriteButton = presenter?.isFavotiteItem ?? false
    
        setupViews()
        setupBarButtomItem()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(productImageView)
        
        costBlockStackView = UIStackView(arrangedSubviews: [productCostLabel, productOldCostLabel], axis: .horizontal, spacing: 20)
        contentView.addSubview(costBlockStackView)
        
        productNameAndDescriptionStackView = UIStackView(arrangedSubviews: [productNameLabel, productDescriptionLabel], axis: .vertical, spacing: 10)
        contentView.addSubview(productNameAndDescriptionStackView)
    }
    
<<<<<<< Updated upstream
    private func listensNotificationFavoriteProductList() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateFavorite), name: NSNotification.Name.updateFavorite, object: nil)
    }
    
    @objc
    private func updateFavorite() {
        presenter?.viewDidLoad()
    }
    
=======
>>>>>>> Stashed changes
    private func setupBarButtomItem() {
        favoriteButtonForItem.setImage(UIImage(systemName: statusIsFavoriteButton ? "heart.fill" : "heart"), for: .normal)
        navigationItem.rightBarButtonItems = [favoriteBarButton]
    }
    
    @objc
    private func tapButtonFavoritesСommodity() {
        guard let id = presenter?.product?.id else { return }
        presenter?.set(favoriteID: id)
        
        let noFavoriteProductImage = UIImage(systemName: "heart")
        let favoriteProductImage = UIImage(systemName: "heart.fill")
        
        let unFavoriteScale: CGFloat = 1.3
        let favoriteScale: CGFloat = 1.3
        
        UIView.animate(withDuration: 0.1, animations: {
            if !self.statusIsFavoriteButton {
                self.favoriteButtonForItem.setImage(favoriteProductImage, for: .normal)
                self.favoriteButtonForItem.transform = (self.favoriteButtonForItem.transform.scaledBy(x: favoriteScale, y: favoriteScale))
                self.statusIsFavoriteButton = true
            } else {
                self.favoriteButtonForItem.setImage(noFavoriteProductImage, for: .normal)
                self.favoriteButtonForItem.transform = (self.favoriteButtonForItem.transform.scaledBy(x: unFavoriteScale, y: unFavoriteScale))
                self.statusIsFavoriteButton = false
            }
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.favoriteButtonForItem.transform = CGAffineTransform.identity
            })
        })
    }
}

extension ProductDetailViewController: ProductDetailViewProtocol {
    func showProductDetail(with product: Product) {
        
        productImageView.image = UIImage(named: product.picture)
        productCostLabel.text = product.cost
        productOldCostLabel.text = product.oldCost
        productNameLabel.text = product.name
        productDescriptionLabel.text = product.description
    }
}

extension ProductDetailViewController {
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 370),
            productImageView.heightAnchor.constraint(equalToConstant: 370),
            
            costBlockStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10),
            costBlockStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
            productNameAndDescriptionStackView.topAnchor.constraint(equalTo: costBlockStackView.bottomAnchor, constant: 10),
            productNameAndDescriptionStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            productNameAndDescriptionStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            productNameAndDescriptionStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
