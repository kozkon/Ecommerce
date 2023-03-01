//
//  CollectionViewHeaderReusableView.swift
//  Ecommerce
//
//  Created by Константин Козлов on 27.12.2022.
//

import UIKit


final class CollectionViewHeaderReusableView: UICollectionReusableView {

    lazy var label: UILabel = {
        var label = UILabel()
        return label
    }()
    
    func setup(_ title: String){
        label.text = title
        layer.borderWidth = 2
        layer.cornerRadius = 5

    }
}
