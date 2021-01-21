//
//  ProductsDetailModel.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/18/21.
//

import Foundation

 // MARK: - ProductsDetailModelProtocol

protocol ProductsDetailModelProtocol {
    var productID: String { get set }
    var name: String { get set }
    var price: Int { get set }
    var image: String { get set }
    var description: String { get set }
}

 // MARK: - ProductsDetailModel

struct ProductsDetailModel: Codable, ProductsDetailModelProtocol {
    
    var productID: String
    var name: String
    var price: Int
    var image: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name, price, image, description
    }
}
