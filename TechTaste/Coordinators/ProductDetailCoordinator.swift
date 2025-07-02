//
//  ProductDetailCoordinator.swift
//  TechTaste
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import UIKit

class ProductDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var product: Product
    
    init(navigationController: UINavigationController, product: Product) {
        self.navigationController = navigationController
        self.product = product
    }
    
    func start() {
        let productDetailViewModel = ProductDetailViewModel(product: product)
        let productDetailViewController = ProductDetailViewController(viewModel: productDetailViewModel)
        navigationController.pushViewController(productDetailViewController, animated: true)
    }
}
