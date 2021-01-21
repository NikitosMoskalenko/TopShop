//
//  CatalogModel.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/18/21.
//

import Foundation

// MARK: - CatalogModel

struct CatalogModel: Codable {
    
    var products: [ProductsModel]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.products = try container.decodeIfPresent([ProductsModel].self, forKey: .products) ?? []
    }
    
}

// MARK: - ProductsModel

struct ProductsModel: Codable {
    
    var product_id: String
    var name: String
    var price: Int
    var image: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.product_id = try container.decodeIfPresent(String.self, forKey: .product_id) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.price = try container.decodeIfPresent(Int.self, forKey: .price) ?? 0
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
    }
}

