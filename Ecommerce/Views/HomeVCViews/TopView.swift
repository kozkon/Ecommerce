//
//  TopViewVC.swift
//  Ecommerce
//
//  Created by Константин Козлов on 13.09.2022.
//

import UIKit

class TopView: UIView{
    
   override init(frame: CGRect) {
        super.init(frame: frame)
       self.addView()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: locationView
    
    private lazy var locationView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.004,
                                  green: 0,
                                  blue: 0.208,
                                  alpha: 1)
        
        label.font = UIFont(name: "Helvetica",
                            size: 15)
        
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "Zihuatanejo, Gro",
                                                         attributes: [NSAttributedString.Key.kern: -0.33])
        return label
    }()
    
    private lazy var locationMarker: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lacationMarker")
        
        return imageView
    }()
    
    private lazy var selectLocationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow")
        return imageView
    }()
    
     lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filter"), for: .normal)
        return button
    }()

 func addView(){
        
       self.confugureLocationView()
        configureSelectCategoryView()
    }
    
    func confugureLocationView(){
        self.addSubview(locationView)
        
        locationView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(19)
        }
        
        locationView.addSubview(locationLabel)
        locationView.addSubview(locationMarker)
        locationView.addSubview(selectLocationImage)
        locationView.addSubview(filterButton)
        
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(19)
        }
        
        locationMarker.snp.makeConstraints { make in
            make.width.equalTo(12)
            make.height.equalTo(15.31)
            make.centerY.equalTo(locationLabel)
            make.right.equalTo(locationLabel.snp.left).offset(-12)
        }
        
        selectLocationImage.snp.makeConstraints { make in
            make.height.equalTo(5)
            make.width.equalTo(10)
            make.centerY.equalTo(locationLabel)
            make.left.equalTo(locationLabel.snp.right).offset(13)
        }
        
        
        filterButton.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.centerY.equalTo(locationLabel)
            make.right.equalToSuperview().offset(-15)
        }
    }
    
    func configureSelectCategoryView(){
        
        let view = BlockHeaderView(leftLabelText: "Select Category", rightLabelText: "view all")
        self.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
                       make.top.equalTo(locationView.snp.bottom).offset(18)
                       make.height.equalTo(32)
        }
    }

}

