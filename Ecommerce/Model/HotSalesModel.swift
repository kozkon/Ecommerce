//
//  HotSalesModel.swift
//  Ecommerce
//
//  Created by Константин Козлов on 18.10.2022.
//

import Foundation

struct HotSales: Codable{
    let homeStore: [HotSalesModel]?
    
    enum CodingKeys: String, CodingKey {
        case homeStore = "home_store"
    }
}

struct HotSalesModel : Codable {
    let id : Int?
    let isNew : Bool?
    let title : String?
    let subtitle : String?
    let picture : String?
    let isBuy : Bool?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case isNew = "is_new"
        case title = "title"
        case subtitle = "subtitle"
        case picture = "picture"
        case isBuy = "is_buy"
    }
}
