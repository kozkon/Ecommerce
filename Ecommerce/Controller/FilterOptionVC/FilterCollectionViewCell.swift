//
//  FilterCollectionViewCell.swift
//  Ecommerce
//
//  Created by Константин Козлов on 27.12.2022.
//

import UIKit

final class FilterCollectionViewCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        var label = UILabel()
        return label
    }()
    
    func setup(_ item: ListParametr){
        label.text = item.parametrName
        layer.borderWidth = 2
        layer.cornerRadius = 5
        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemGray
    }
}
