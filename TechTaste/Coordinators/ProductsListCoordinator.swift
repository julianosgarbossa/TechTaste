//
//  ProductsListCoordinator.swift
//  TechTaste
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import UIKit

class ProductsListCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let productsListViewController = ProductsListViewController()
        productsListViewController.coordinator = self
        navigationController.pushViewController(productsListViewController, animated: true)
    }
    
    func showProductDetail(for product: Product) {
        let productDetailCoordinator = ProductDetailCoordinator(navigationController: navigationController, product: product)
        self.childCoordinators.append(productDetailCoordinator)
        productDetailCoordinator.start()
    }
}
