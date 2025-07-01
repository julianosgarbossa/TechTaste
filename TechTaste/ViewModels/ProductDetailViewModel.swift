//
//  ProductDetailViewModel.swift
//  TechTaste
//
//  Created by Juliano Sgarbossa on 01/07/25.
//

import Foundation

class ProductDetailViewModel {
    var productName: String
    var productDescription: String
    var ProductFormattedPrice: String
    var productImage: String
    
    init(product: Product) {
        self.productName = product.name
        self.productDescription = product.description
        self.ProductFormattedPrice = product.formattedPrice
        self.productImage = product.image
    }
}
