//
//  MockData.swift
//  Ecommerce
//
//  Created by Константин Козлов on 15.12.2022.
//

import UIKit

struct MockData {
   
    
    static let shared = MockData()
    
    private let brand: ListSection = {
        .brand([.init(parametrName: "Iphone"),
                  .init(parametrName: "Samsung"),
                  .init(parametrName: "Xiaomi"),
                  ])
    }()
    
    private let price: ListSection = {
        .price([.init(parametrName: "$100 - $300"),
                  .init(parametrName: "$301 - $600"),
                .init(parametrName: "$601 - $1000")])
    }()
    
    private let size: ListSection = {
        .size([.init(parametrName: "4.5 to 5.5 inches"),
                     .init(parametrName: "5.6 to 6.5 inches"),
                     .init(parametrName: "more than 6.6 inches")])
    }()
    
    var pageData: [ListSection] {
        [brand, price, size]
    }
}
