//
//  CatalogModel.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/19/21.
//

import Foundation

enum ViewCondition {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let iconName: String?
        let titleText: String?
        let price: String?
    }
}
