//
//  ProductDetailViewController.swift
//  TechTaste
//
//  Created by Juliano Sgarbossa on 01/07/25.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var viewModel: ProductDetailViewModel

    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: viewModel.productImage)
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.numberOfLines = 0
        label.textColor = UIColor(named: AssetsConstants.mediumOrange)
        label.text = viewModel.productName
        return label
    }()
    
    private lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: AssetsConstants.lightGray)
        label.numberOfLines = 0
        label.text = viewModel.productDescription
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: AssetsConstants.lightGray)
        label.text = viewModel.ProductFormattedPrice
        return label
    }()
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setVisualElements()
    }
    
    private func setupUI() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.backgroundColor = UIColor(named: AssetsConstants.backgroundColor)
    }
    
    private func setVisualElements() {
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
        view.addSubview(productDescriptionLabel)
        view.addSubview(productPriceLabel)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            productImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            productImageView.heightAnchor.constraint(equalToConstant: 280),
            
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 24),
            productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            productNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 24),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            productPriceLabel.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 24),
            productPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            productPriceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }
}
