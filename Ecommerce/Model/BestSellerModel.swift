//
//  BestSellerModel.swift
//  Ecommerce
//
//  Created by Константин Козлов on 07.11.2022.
//

import Foundation

struct BestSeller: Codable{
    let bestSeller: [BestSellerModel]?
    
    enum CodingKeys: String, CodingKey {
        case bestSeller = "best_seller"
    }
}

struct BestSellerModel : Codable {
    let id : Int?
    let isFavorites : Bool?
    let title : String?
    let priceWithoutDiscount : Int?
    let discountPrice : Int?
    let picture : String?
    

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case isFavorites = "is_favorites"
        case title = "title"
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case picture = "picture"
    }
}
