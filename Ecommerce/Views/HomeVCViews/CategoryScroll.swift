//
//  sele.swift
//  Ecommerce
//
//  Created by Константин Козлов on 08.11.2022.
//

import UIKit

final class CategoryScroll: UIScrollView{
    
    private var tagSelectedCategory = 1
    private var categories = [CategoryModel]()
    var anc = 20
    private let phoneWhite = UIImage(named: "PhoneWhite") ?? UIImage()
    private let phoneGray = UIImage(named: "PhoneGray") ?? UIImage()
    private let healthWhite = UIImage(named: "HealthWhite") ?? UIImage()
    private let healthGray = UIImage(named: "HealthGray") ?? UIImage()
    private let computerWhite = UIImage(named: "ComputerWhite") ?? UIImage()
    private let computerGray = UIImage(named: "ComputerGray") ?? UIImage()
    private let booksWhite = UIImage(named: "BooksWhite") ?? UIImage()
    private let booksGray = UIImage(named: "BooksGray") ?? UIImage()
    
    
    
    private lazy var selectCategoryScrollContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefaultArraySelectCategory()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDefaultArraySelectCategory(){
        
        categories = [CategoryModel(image: phoneGray, title: "Phones", selected: false),
                      CategoryModel(image: computerGray, title: "Computer", selected: false),
                      CategoryModel(image: healthGray, title: "Health", selected: false),
                      CategoryModel(image: booksGray, title: "Books", selected: false),
                      CategoryModel(image: UIImage(), title: "Other", selected: false)]
        
        setupSelectCategoryScroll()
    }
    
    
    private func setupSelectCategoryScroll(){
        
        addSubview(selectCategoryScrollContentView)
        
        selectCategoryScrollContentView.snp.makeConstraints { make in
            
            make.edges.equalToSuperview()
            make.height.equalTo(120)
            make.width.equalTo(10 + categories.count * 100 + 10)
        }
        
        createButtonScrollCategory()
    }
    
    private func createButtonScrollCategory(){
        
        var leftAcn = 10
        var tag = 1
        for category in categories {
            
            let view = UIView()
            let shadowView = ShadowView()
            let label = UILabel()
            selectCategoryScrollContentView.addSubview(view)
            
            view.snp.makeConstraints { make in
                make.top.equalTo(selectCategoryScrollContentView.snp.top)
                make.bottom.equalTo(selectCategoryScrollContentView.snp.bottom)
                make.left.equalTo(selectCategoryScrollContentView.snp.left).offset(leftAcn)
                make.width.equalTo(100)
            }
            
            let button = ButtonInScroll()
            button.imageView?.contentMode = .scaleAspectFit
            button.imageView?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.8)
            
            button.tag = tag
            let selectColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
            
            let combination = (category.title, (button.tag == tagSelectedCategory))
            
            switch combination {
            case ("Phones", true):
                button.setImage(phoneWhite, for: .normal)
                button.backgroundColor = selectColor
                label.textColor = selectColor
            case ("Phones", false):
                button.setImage(phoneGray, for: .normal)
                button.backgroundColor = .white
            case ("Computer", true):
                button.setImage(computerWhite, for: .normal)
                button.backgroundColor = selectColor
                label.textColor = selectColor
            case ("Computer", false):
                button.setImage(computerGray, for: .normal)
                button.backgroundColor = .white
            case ("Health", true):
                button.setImage(healthWhite, for: .normal)
                button.backgroundColor = selectColor
                label.textColor = selectColor
            case ("Health", false):
                button.setImage(healthGray, for: .normal)
                button.backgroundColor = .white
            case ("Books", true):
                button.setImage(booksWhite, for: .normal)
                button.backgroundColor = selectColor
                label.textColor = selectColor
            case ("Books", false):
                button.setImage(booksGray, for: .normal)
                button.backgroundColor = .white
            case ("Other", true):
                button.setImage(UIImage(), for: .normal)
                button.backgroundColor = selectColor
                label.textColor = selectColor
            case ("Other", false):
                button.setImage(UIImage(), for: .normal)
                button.backgroundColor = .white
            default:
                break
            }
            
            button.tag = tag
            button.layer.cornerRadius = 40
            button.clipsToBounds = true
            button.imageView?.image = category.image
            button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
            
            label.text = category.title
            label.textAlignment = .center
            
            view.addSubview(shadowView)
            shadowView.addSubview(button)
            view.addSubview(label)
            
            shadowView.snp.makeConstraints { make in
                make.left.equalTo(view.snp.left).offset(10)
                make.top.equalTo(view.snp.top).offset(15)
                make.right.equalTo(view.snp.right).offset(-10)
                make.height.equalTo(80)
            }
            
            button.snp.makeConstraints { make in
                make.edges.equalTo(shadowView)
            }
            
            label.snp.makeConstraints { make in
                make.centerX.equalTo(button.snp.centerX)
                make.top.equalTo(button.snp.bottom).offset(5)
                make.width.equalTo(button.snp.width)
                make.bottom.equalTo(view.snp.bottom)
            }
            leftAcn += 100
            tag += 1
        }
    }
    
    @objc func tapButton(sender: UIButton) {
        
        if !(sender.tag == tagSelectedCategory) {
            tagSelectedCategory = sender.tag
            for subview in self.selectCategoryScrollContentView.subviews {
                subview.removeFromSuperview()
            }
            createButtonScrollCategory()
        }else{
            tagSelectedCategory = sender.tag
        }
    }
}
