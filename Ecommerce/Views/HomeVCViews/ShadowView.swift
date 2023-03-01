//
//  ShadowView.swift
//  Ecommerce
//
//  Created by Константин Козлов on 12.10.2022.
//

//

import UIKit

class ShadowView: UIView {

    
    var cornerRadius: CGFloat = 40.0
    
    var shadowColor: UIColor = .darkGray {
        didSet {
//            layer.shadowColor = UIColor(red: 0.656, green: 0.669, blue: 0.788, alpha: 0.15).cgColor
//            layer.shadowColor = UIColor(red: 0.75, green: 0.771, blue: 0.962, alpha: 0.15).cgColor
//            layer.shadowColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.65).cgColor
//            layer.shadowColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1).cgColor
        }
    }
    
    var shadowOpacity: Float = 0.3 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    var shadowOffset = CGSize(width: 0 , height: 0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    var shadowRadius: CGFloat = 7.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupShadow()
    }
    
    private func setupShadow() {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        
 
      

        
      //  layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        layer.shadowPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        
    }

}
