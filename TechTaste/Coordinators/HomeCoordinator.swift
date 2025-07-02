//
//  HomeCoordinator.swift
//  TechTaste
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func showProducstsList() {
        let productsListCoordinator = ProductsListCoordinator(navigationController: navigationController)
        childCoordinators.append(productsListCoordinator)
        productsListCoordinator.start()
    }
}
