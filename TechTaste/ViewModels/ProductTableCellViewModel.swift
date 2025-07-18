//
//  ProductTableCellViewModel.swift
//  TechTaste
//
//  Created by Juliano Sgarbossa on 01/07/25.
//

import Foundation

class ProductTableCellViewModel {
    var productId: Int
    var productName: String
    var productDescription: String
    var productFormattedPrice: String
    var productImage: String
    
    init(product: Product) {
        self.productId = product.id
        self.productName = product.name
        self.productDescription = product.description
        self.productFormattedPrice = product.formattedPrice
        self.productImage = product.image
    }
}
