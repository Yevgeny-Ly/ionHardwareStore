//
//  ProfileViewController.swift
//  iON
//
//  Created by Евгений Л on 30.09.2023.
//

import UIKit

enum Constants {
    static var imageHeight: CGFloat = 350
    static var buttonHeight: CGFloat = 50
    static var buttonWidth: CGFloat = 150
}

class ProfileViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let userPictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userPicture")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var goInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .specialOrange
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pressGoInButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var myOrdersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Мои заказы", for: .normal)
        button.setImage(UIImage(systemName: "basket"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.tintColor = .black
        button.titleLabel?.font = .robotoMedium18()
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonPressMyOrders), for: .touchUpInside)
        return button
    }()
    
    private let myOrdersLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        return view
    }()
    
    private lazy var myReturnsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Мои возвраты", for: .normal)
        button.setImage(UIImage(systemName: "arrow.uturn.backward"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.tintColor = .black
        button.titleLabel?.font = .robotoMedium18()
        button.addTarget(self, action: #selector(buttonPressMyReturns), for: .touchUpInside)
        return button
    }()
    
    private let myReturnsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        return view
    }()
    
    private lazy var noticesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Уведомления", for: .normal)
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.tintColor = .black
        button.titleLabel?.font = .robotoMedium18()
        button.addTarget(self, action: #selector(buttonPressNotices), for: .touchUpInside)
        return button
    }()
    
    private let noticesLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        return view
    }()
    
    private lazy var informationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Справка", for: .normal)
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.tintColor = .black
        button.titleLabel?.font = .robotoMedium18()
        button.addTarget(self, action: #selector(buttonPressInformation), for: .touchUpInside)
        return button
    }()
    
    private let informationLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        return view
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Настройки", for: .normal)
        button.setImage(UIImage(systemName: "slider.vertical.3"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.tintColor = .black
        button.titleLabel?.font = .robotoMedium18()
        button.addTarget(self, action: #selector(buttonPressSettings), for: .touchUpInside)
        return button
    }()
    
    private let settingsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupFrameViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupViews() {
        
        setupScrollView()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.addSubview(userPictureImageView)
        scrollView.addSubview(goInButton)
        scrollView.addSubview(myOrdersButton)
        scrollView.addSubview(myOrdersLineView)
        scrollView.addSubview(myReturnsButton)
        scrollView.addSubview(myReturnsLineView)
        scrollView.addSubview(noticesButton)
        scrollView.addSubview(noticesLineView)
        scrollView.addSubview(informationButton)
        scrollView.addSubview(informationLineView)
        scrollView.addSubview(settingsButton)
        scrollView.addSubview(settingsLineView)
    }
    
    private func setupFrameViews() {
        userPictureImageView.frame = .init(x: 0, y: -scrollView.safeAreaInsets.top, width: scrollView.bounds.width, height: Constants.imageHeight)
        
        goInButton.frame = .init(x: userPictureImageView.frame.width / 3.3, y: userPictureImageView.frame.height / 1.6, width: Constants.buttonWidth, height: Constants.buttonHeight)
        
        myOrdersButton.frame = .init(x: -scrollView.frame.width / 3.7, y: scrollView.frame.height / 2.9, width: scrollView.bounds.width, height: Constants.buttonHeight)
        myOrdersLineView.frame = .init(x: scrollView.bounds.minX + 20, y: scrollView.frame.height / 2.5, width: scrollView.bounds.width - 40, height: 1)
        
        myReturnsButton.frame = .init(x: -scrollView.frame.width / 4, y: scrollView.frame.height / 2.5, width: scrollView.bounds.width, height: Constants.buttonHeight)
        myReturnsLineView.frame = .init(x: scrollView.bounds.minX + 20, y: scrollView.frame.height / 2.19, width: scrollView.bounds.width - 40, height: 1)
        
        noticesButton.frame = .init(x: -scrollView.frame.width / 3.9, y: scrollView.frame.height / 2.2, width: scrollView.bounds.width, height: Constants.buttonHeight)
        noticesLineView.frame = .init(x: scrollView.bounds.minX + 20, y: scrollView.frame.height / 1.95, width: scrollView.bounds.width - 40, height: 1)
        
        informationButton.frame = .init(x: -scrollView.frame.width / 3.25, y: scrollView.frame.height / 1.955, width: scrollView.bounds.width, height: Constants.buttonHeight)
        informationLineView.frame = .init(x: scrollView.bounds.minX + 20, y: scrollView.frame.height / 1.76, width: scrollView.bounds.width - 40, height: 1)
        
        settingsButton.frame = .init(x: -scrollView.frame.width / 3.49, y: scrollView.frame.height / 1.765, width: scrollView.bounds.width, height: Constants.buttonHeight)
        settingsLineView.frame = .init(x: scrollView.bounds.minX + 20, y: scrollView.frame.height / 1.60, width: scrollView.bounds.width - 40, height: 1)
    }
    
    private func setupScrollView() {
        scrollView.delegate = self
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.width, height: 715)
    }
    
    @objc
    private func pressGoInButton() {
        print("Press Go In Button")
    }
    
    @objc
    private func buttonPressMyOrders() {
        print("button Press My Orders")
    }
    
    @objc
    private func buttonPressMyReturns() {
        print("button Press My Returns")
    }
    
    @objc
    private func buttonPressNotices() {
        print("button Press Notices Button")
    }
    
    @objc
    private func buttonPressInformation() {
        print("button Press Information")
    }
    
    @objc
    private func buttonPressSettings() {
        print("button Press Settings")
    }
}

extension ProfileViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y + scrollView.safeAreaInsets.top
        
        if offSetY < 0 {
            userPictureImageView.frame = .init(x: 0, y: -scrollView.safeAreaInsets.top + offSetY, width: scrollView.bounds.width, height: Constants.imageHeight + abs(offSetY))
        }
        scrollView.verticalScrollIndicatorInsets.top = userPictureImageView.frame.height - scrollView.safeAreaInsets.top
    }
}
