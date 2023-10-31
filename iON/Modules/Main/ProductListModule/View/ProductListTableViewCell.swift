//
//  ProductListTableViewCell.swift
//  iON
//
//  Created by Евгений Л on 03.10.2023.
//

import UIKit

protocol ProductListCellDelegate: AnyObject { // делегат который отвечает за обработку id в избранном
    func setting(favoriteID: String) 
}

class ProductListTableViewCell: UITableViewCell {

    static let reuseIdentifier = NSStringFromClass(ProductListTableViewCell.self) 
    
    private var statusIsFavoriteButton = false
    
    var product: Product?
    
    weak var delegate: ProductListCellDelegate?
    
    private let backgroundCellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let commodityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var productFavoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(favoriteProductPressButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .robotoMedium18()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialGreen
        label.font = .robotoBold18()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let oldCostLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialGrey
        label.font = .robotoMedium12()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var costBlockStackView = UIStackView()
    
    private let colorWheelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
     
    private lazy var basketButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "cart"), for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(addToBasketPressButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    func configurationCell(with model: Product, isFavorite: Bool) {
        product = model
        statusIsFavoriteButton = isFavorite
        
        productFavoriteButton.tintColor = isFavorite ? .specialOrange : .black // меняю цвет при нажатии на кнопку сердечко
        productFavoriteButton.setImage(UIImage(systemName: isFavorite ? "heart.fill" : "heart"), for: .normal)
        
        commodityImageView.image = UIImage(named: model.picture)
        productNameLabel.text = model.name
        costLabel.text = model.cost
        oldCostLabel.text = model.oldCost
    }
    
    private func setupViews() { 
        backgroundColor = .clear
        selectionStyle = .none
        
        costBlockStackView = UIStackView(arrangedSubviews: [costLabel, oldCostLabel], axis: .horizontal, spacing: 10)
         
        contentView.addSubview(backgroundCellView)
        contentView.addSubview(commodityImageView)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(costBlockStackView)
        contentView.addSubview(productFavoriteButton)
        contentView.addSubview(basketButton)
    }
    
    @objc
    private func favoriteProductPressButton() {
        delegate?.setting(favoriteID: product?.id ?? "no ID") // с ячейки передаю в viewController, в метод cellForRowAt
        
        let noFavoriteProductImage = UIImage(systemName: "heart")
        let favoriteProductImage = UIImage(systemName: "heart.fill")
        
        let unFavoriteScale: CGFloat = 1.3
        let favoriteScale: CGFloat = 1.3
        
        UIView.animate(withDuration: 0.1, animations: {
            if !self.statusIsFavoriteButton {
                self.productFavoriteButton.setImage(favoriteProductImage, for: .normal)
                self.productFavoriteButton.transform = self.productFavoriteButton.transform.scaledBy(x: unFavoriteScale, y: unFavoriteScale)
                self.statusIsFavoriteButton = true
            } else {
                self.productFavoriteButton.setImage(noFavoriteProductImage, for: .normal)
                self.productFavoriteButton.transform = self.productFavoriteButton.transform.scaledBy(x: favoriteScale, y: favoriteScale)
                self.statusIsFavoriteButton = false
            }
            
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.productFavoriteButton.transform = CGAffineTransform.identity
            })
        })
    }
    
    @objc
    private func addToBasketPressButton() {
        print("Add To Basket Press Button")
    }
}

extension ProductListTableViewCell {
    private func setupConstraints() {
        let marginGuide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            backgroundCellView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCellView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            backgroundCellView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            backgroundCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            commodityImageView.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor),
            commodityImageView.leftAnchor.constraint(equalTo: marginGuide.leftAnchor, constant: 0),
            commodityImageView.widthAnchor.constraint(equalToConstant: 95),
            commodityImageView.heightAnchor.constraint(equalToConstant: 95),
            
            productFavoriteButton.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 7),
            productFavoriteButton.rightAnchor.constraint(equalTo: marginGuide.rightAnchor),
            productFavoriteButton.widthAnchor.constraint(equalToConstant: 30),
            productFavoriteButton.heightAnchor.constraint(equalToConstant: 30),
            
            productNameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 10),
            productNameLabel.leftAnchor.constraint(equalTo: commodityImageView.rightAnchor, constant: 10),
            productNameLabel.rightAnchor.constraint(equalTo: productFavoriteButton.leftAnchor, constant: -5),
            productNameLabel.bottomAnchor.constraint(equalTo: costBlockStackView.topAnchor, constant: -5),
            
            costBlockStackView.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 15),
            costBlockStackView.leftAnchor.constraint(equalTo: commodityImageView.rightAnchor, constant: 10),
            
            basketButton.topAnchor.constraint(equalTo: costBlockStackView.bottomAnchor, constant: 10),
            basketButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            basketButton.widthAnchor.constraint(equalToConstant: 30),
            basketButton.heightAnchor.constraint(equalToConstant: 30),
            basketButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
