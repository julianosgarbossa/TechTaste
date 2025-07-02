//
//  MainCoordinator.swift
//  TechTaste
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func showProducstsList() {
        let productsListViewController = ProductsListViewController()
        productsListViewController.coordinator = self
        navigationController.pushViewController(productsListViewController, animated: true)
    }
    
    func showProductDetail(for product: Product) {
        let productDetailViewModel = ProductDetailViewModel(product: product)
        let productDetailViewController = ProductDetailViewController(viewModel: productDetailViewModel)
        navigationController.pushViewController(productDetailViewController, animated: true)
    }
}
