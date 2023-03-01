//
//  TitleOfBlockView.swift
//  Ecommerce
//
//  Created by Константин Козлов on 02.11.2022.
//

import UIKit

final class BlockHeaderView: UIView {
    
    let leftLabelText: String
    let rightLabelText: String
    
    lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold",
                            size: 25)
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: leftLabelText,
                                                         attributes: [NSAttributedString.Key.kern: -0.33])
        return label
    }()
    
    lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica",
                            size: 15)
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: rightLabelText,
                                                         attributes: [NSAttributedString.Key.kern: -0.33])
        label.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        return label
    }()
    
    init(leftLabelText: String, rightLabelText: String){
       
        self.leftLabelText = leftLabelText
        self.rightLabelText = rightLabelText
        
        super.init(frame: .zero)
        self.setupHotSalesLabelsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setupHotSalesLabelsView(){
        
        self.addSubview(leftLabel)
        self.addSubview(rightLabel)
       
       leftLabel.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
        }
        
        rightLabel.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview()
        }
     }
}
