//
//  ProductsListViewModel.swift
//  TechTaste
//
//  Created by Juliano Sgarbossa on 27/06/25.
//

import Foundation

class ProductsListViewModel {
    var products: Observable<[Product]> = Observable(value: [])
    private var networkingManager: NetworkingManager
    
    init(networkingManager: NetworkingManager = NetworkingManager()) {
        self.networkingManager = networkingManager
    }
    
    func getAllProducts() {
        networkingManager.getProductsList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products.value = products
                }
            case .failure(let error):
                print("Ocorreu um erro ao obter os produtos: \(error.localizedDescription)")
            }
        }
    }
    
    func getNumberOfRowsOfTableView() -> Int {
        return products.value?.count ?? 0
    }
}
