//
//  ProductDetailViewController.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var presenter: ProductDetailPresenterProtocol?
    
    private var statusIsFavoriteButton = false
    
    lazy var favoriteBarButton = UIBarButtonItem(customView: favoriteButtonForItem)
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
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
    
    lazy private var favoriteButtonForItem: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .specialOrange
        button.addTarget(self, action: #selector(pressButtonFavoritesItem), for: .touchUpInside)
        return button
    }()
    
    private lazy var buyInOneClickButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Купить в 1 клик", for: .normal)
        button.backgroundColor = .specialOrange
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .robotoBold16()
        button.addTarget(self, action: #selector(buttonPressBuyOneClick), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var toCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("В корзину", for: .normal)
        button.backgroundColor = .specialGreen
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .robotoBold16()
        button.addTarget(self, action: #selector(buttonPressToCart), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var blockButtonBuyStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.viewDidLoad()

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
        
        blockButtonBuyStackView = UIStackView(arrangedSubviews: [buyInOneClickButton, toCartButton], axis: .horizontal, spacing: 10)
        blockButtonBuyStackView.distribution = .fillEqually
        view.addSubview(blockButtonBuyStackView)
    }
    
    private func listensNotificationFavoriteProductList() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateFavorite), name: NSNotification.Name.updateFavorite, object: nil)
    }
    
    @objc
    private func buttonPressBuyOneClick() {
        print("button Press Buy One Click")
    }
    
    @objc
    private func buttonPressToCart() {
        print("button Press To Cart")
    }
    
    @objc
    private func updateFavorite() {
        presenter?.viewDidLoad()
    }
    
    private func setupBarButtomItem() {
        favoriteButtonForItem.setImage(UIImage(systemName: statusIsFavoriteButton ? "heart.fill" : "heart"), for: .normal)
        navigationItem.rightBarButtonItems = [favoriteBarButton]
    }
    
    @objc
    private func pressButtonFavoritesItem() {
        
        guard let id = presenter?.product?.id else { return }
        presenter?.set(favoriteID: id)
        
        let noFavoriteProductImage = UIImage(systemName: "heart")
        let favoriteProductImage = UIImage(systemName: "heart.fill")
        
        let unFavoriteScale: CGFloat = 1.3
        let favoriteScale: CGFloat = 1.3
        
        UIView.animate(withDuration: 0.1, animations: {
            if !self.statusIsFavoriteButton {
                self.favoriteButtonForItem.setImage(favoriteProductImage, for: .normal)
                self.favoriteButtonForItem.tintColor = .specialOrange
                self.favoriteButtonForItem.transform = (self.favoriteButtonForItem.transform.scaledBy(x: favoriteScale, y: favoriteScale))
                self.statusIsFavoriteButton = true
            } else {
                self.favoriteButtonForItem.setImage(noFavoriteProductImage, for: .normal)
                self.favoriteButtonForItem.tintColor = .black
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
            scrollView.bottomAnchor.constraint(equalTo: blockButtonBuyStackView.topAnchor, constant: 1),
            
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
            productNameAndDescriptionStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            blockButtonBuyStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            blockButtonBuyStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            blockButtonBuyStackView.heightAnchor.constraint(equalToConstant: 55),
            blockButtonBuyStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
}
