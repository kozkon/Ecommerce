//
//  ButtonInScroll.swift
//  Ecommerce
//
//  Created by Константин Козлов on 12.10.2022.
//

import UIKit

class ButtonInScroll: UIButton {
    
    private var shadowLayer: CAShapeLayer!

        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.imageView?.contentMode = .scaleAspectFit
            self.imageView?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.8)
  }
    }
    
  

