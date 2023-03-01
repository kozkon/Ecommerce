//
//  BannersView.swift
//  Ecommerce
//
//  Created by Константин Козлов on 17.10.2022.
//

import UIKit
import Kingfisher



final class BannersView: UIView {
    
    var hotSales: HotSales!
    var imageViews1 = [UIView]()
    private let scrollView = UIScrollView()
    
    private lazy var isNewButton: UIButton = {
        let button = UIButton()
        button.setTitle("New", for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Helvetica",
                                         size: 11)
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        button.contentHorizontalAlignment = .center
        return button
    }()
    

    init(hotSales: HotSales) {
        
        self.hotSales = hotSales
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView(){
        guard let homeStore = hotSales.homeStore else {return}
        
        
        for item in 1...homeStore.count {
            let homeStoreNumberView = homeStore[item - 1]
            let view = UIView()
            view.layer.cornerRadius = 10
            view.clipsToBounds = true
            
            let salesImage: UIImageView = {
                let imageView = UIImageView()
                imageView.contentMode = .scaleToFill
                
                return imageView
            }()
            
            guard let stringURL = homeStoreNumberView.picture else {return}
            let url = URL(string: stringURL)
            salesImage.kf.setImage(with: url)
            
            view.addSubview(salesImage)
            
            salesImage.snp.makeConstraints { make in
                make.edges.equalTo(view)
            }
            
            if homeStoreNumberView.isNew ?? false {
                view.addSubview(isNewButton)
                isNewButton.snp.makeConstraints({ make in
                    make.top.equalTo(view.snp.top).offset(15)
                    make.left.equalTo(view.snp.left).offset(30)
                    make.height.width.equalTo(28)
                })
            }
            
            let titleLabel: UILabel = {
                let label = UILabel()
                label.textColor = .white
                label.textAlignment = .center
                label.font = UIFont(name: "Helvetica-Bold",
                                    size: 25)
                return label
            }()
            
            view.addSubview(titleLabel)
            titleLabel.text = homeStoreNumberView.title
            
            
            titleLabel.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(30)
                make.top.equalToSuperview().offset(55)
            }
            
            let subtitleLabel: UILabel = {
                let label = UILabel()
                label.textColor = .white
                label.font = UIFont(name: "Helvetica",
                                    size: 11)
                return label
            }()
            
            view.addSubview(subtitleLabel)
            subtitleLabel.text = homeStoreNumberView.subtitle
            
            
            subtitleLabel.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(30)
                make.top.equalTo(titleLabel.snp.bottom)
            }
            
            let buyNowButton: UIButton = {
                let button = UIButton()
                button.setTitle("Buy now!", for: .normal)
                button.backgroundColor = .white
                button.layer.cornerRadius = 5
                button.clipsToBounds = true
                button.setTitleColor(UIColor(white: 0, alpha: 1), for: .normal)
                button.titleLabel?.font = UIFont(name: "Helvetica",
                                                 size: 11)
                return button
            }()
            
            view.addSubview(buyNowButton)
            
            buyNowButton.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(30)
                make.top.equalTo(subtitleLabel.snp.bottom).offset(20)
                make.width.equalTo(100)
            }
            
           imageViews1.append(view)
        }
    }
    
    private func setup() {
        
        createView()
        
        self.addSubview(self.scrollView)
        self.setupScrollView()
        let imageViews = imageViews1
        
        imageViews.forEach(self.scrollView.addSubview)
        
        self.scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        self.scrollView.delegate = self
    }
    
    private func setupScrollView() {
        self.scrollView.decelerationRate = .fast
        self.scrollView.showsHorizontalScrollIndicator = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.scrollView.frame = self.bounds
        
        let horizontalItemOffsetFromSuperView: CGFloat = 16.0
        let spaceBetweenItems: CGFloat = 8.0
        let itemWidth = self.frame.width - horizontalItemOffsetFromSuperView * 2
        let itemHeight: CGFloat = self.scrollView.frame.height
        
        var startX: CGFloat = 0.0
        let imageViews = imageViews1
        
        imageViews.forEach { view in
            view.frame.origin = CGPoint(x: startX, y: 0.0)
            view.frame.size = CGSize(width: itemWidth, height: itemHeight)
            startX += itemWidth + spaceBetweenItems
        }
        guard let homeStore = hotSales.homeStore else {return}
        
        let viewsCount: CGFloat = CGFloat(homeStore.count)
        let contentWidth: CGFloat = itemWidth * viewsCount + spaceBetweenItems * (viewsCount - 1.0)
        self.scrollView.contentSize = CGSize(width: contentWidth, height: self.frame.height)
    }
}


//MARK: UIScrollViewDelegate
extension BannersView: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let gap: CGFloat = self.imageViews1[0].frame.width / 3
        let targetRightOffsetX = targetContentOffset.pointee.x
        let numberLastView = imageViews1.count - 1
        
        if (self.imageViews1[numberLastView - 2].frame.minX + gap) > targetRightOffsetX {
            targetContentOffset.pointee.x = self.imageViews1[numberLastView - 2].frame.minX - 16
        }
        else if (self.imageViews1[numberLastView - 1].frame.minX + gap) > targetContentOffset.pointee.x {
            targetContentOffset.pointee.x = self.imageViews1[numberLastView - 1].frame.minX - 16
        }
        else {
            targetContentOffset.pointee.x = self.imageViews1[numberLastView].frame.midX - self.frame.midX
        }
    }
}

