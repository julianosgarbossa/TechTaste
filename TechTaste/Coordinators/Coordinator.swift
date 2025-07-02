//
//  Coordinator.swift
//  TechTaste
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}
