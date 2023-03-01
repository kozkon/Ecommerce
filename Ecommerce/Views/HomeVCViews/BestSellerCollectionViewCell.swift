//
//  BestSellerCollectionViewCell.swift
//  Ecommerce
//
//  Created by Константин Козлов on 07.11.2022.
//

import UIKit

class BestSellerCollectionViewCell: UICollectionViewCell{

    
    private lazy var shadowView: ShadowView = {
        let view = ShadowView()
        view.layer.shadowRadius = 10
        view.cornerRadius = 10
        return view
    }()
    
    private lazy var contentViewCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var SHadowViewOfButton: ShadowView = {
        let view = ShadowView()
        return view
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.setImage(UIImage(named: "fillHeart"), for: .normal)
        
        return button
    }()
    
    private lazy var priceWithoutDiscountLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 10)
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "$1,500", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.kern: -0.33])
        
        return label
    }()
    
    private lazy var discountPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "$1,047", attributes: [NSAttributedString.Key.kern: -0.33])
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue", size: 10)
        label.attributedText = NSMutableAttributedString(string: "Samsung Galaxy s20 Ultra", attributes: [NSAttributedString.Key.kern: -0.33])
        return label
    }()
    
    private func setupUI(){
        addSubview(shadowView)
        shadowView.addSubview(contentViewCell)
        contentViewCell.addSubview(imageView)
        contentViewCell.addSubview(SHadowViewOfButton)
        SHadowViewOfButton.addSubview(favoriteButton)
        contentViewCell.addSubview(priceWithoutDiscountLabel)
        contentViewCell.addSubview(discountPriceLabel)
        contentViewCell.addSubview(titleLabel)
        
        shadowView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.right.left.equalToSuperview().offset(0)
        }
        
        contentViewCell.snp.makeConstraints { make in
            make.edges.equalTo(shadowView)
        }
      
        imageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(168)
        }
        
        SHadowViewOfButton.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        discountPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(contentViewCell.snp.left).offset(20)
            make.top.equalTo(imageView.snp.bottom).offset(2)
            make.height.equalTo(20)
         }
        priceWithoutDiscountLabel.snp.makeConstraints { make in
            make.left.equalTo(discountPriceLabel.snp.right).offset(7)
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.height.equalTo(13)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(discountPriceLabel.snp.left)
            make.top.equalTo(discountPriceLabel.snp.bottom).offset(5)
            make.height.equalTo(13)
        }
     }
    
    func setupData(model: BestSellerModel){
        
        DispatchQueue.main.async {
            
            if model.isFavorites ?? false{
                self.favoriteButton.setImage(UIImage(named: "fillHeart"), for: .normal)
            }else{
                self.favoriteButton.setImage(UIImage(named: "emptyHeart"), for: .normal)
            }
            
            guard let img = model.picture else {return}
            self.imageView.kf.setImage(with: URL(string: img))
            
            guard let price = model.discountPrice else {return}
            self.discountPriceLabel.text = String(price)
            
            guard let price = model.priceWithoutDiscount else {return}
            self.priceWithoutDiscountLabel.text = String(price)
            
            guard let title = model.title else {return}
            self.titleLabel.text = title
            
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
