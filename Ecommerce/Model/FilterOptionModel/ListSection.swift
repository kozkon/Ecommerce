//
//  ListSection.swift
//  Ecommerce
//
//  Created by Константин Козлов on 15.12.2022.
//

import Foundation


enum ListSection {
    case brand([ListParametr])
    case price([ListParametr])
    case size([ListParametr])
    
    var items: [ListParametr] {
        switch self {
        case .brand(let items),
                .price(let items),
                .size(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .brand:
            return "Brand"
        case .price:
            return "Price"
        case .size:
            return "Size"
        }
    }
    

    
}
