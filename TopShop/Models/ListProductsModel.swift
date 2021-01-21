//
//  ListProductsModel.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/18/21.
//

import Foundation

// MARK: - CatalogModel

struct ListProductsModel: Codable {
    
    var products: [ProductsModel]

}

// MARK: - ProductsModel

struct ProductsModel: Codable {
    
    var productID: String
    var name: String
    var price: Int
    var image: String

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name, price, image
    }
}

