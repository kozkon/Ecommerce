//
//  SearchContainerView.swift
//  Ecommerce
//
//  Created by Константин Козлов on 08.11.2022.
//

import UIKit

final class SearchContainerView: UIView{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
     lazy var searchShadowView: ShadowView = {
        let view = ShadowView()

        return view
    }()
    
     lazy var search: UITextField = {
        var search = UITextField()
        search.backgroundColor = .white
        search.layer.cornerRadius = 25
        search.clipsToBounds = true
        
        let imageView = UIImageView()
        let image = UIImage(named: "search")
        imageView.image = image
        imageView.frame = CGRect(x: 15, y: 15, width: 20, height: 20)
        search.addSubview(imageView)
        let leftView = UIView(frame: CGRect(x: 60, y: 2, width: 50, height: 30))
        search.leftView = leftView
        search.leftViewMode = UITextField.ViewMode.always
        search.placeholder = "Search"
        
        return search
    }()
    
    private lazy var QRButton: UIButton = {
        let QRButton = ButtonInScroll()
        QRButton.setImage(UIImage(named: "QR"), for: .normal)
        QRButton.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        QRButton.contentMode = .scaleAspectFill
        QRButton.layer.cornerRadius = 25
        QRButton.clipsToBounds = true
        return QRButton
    }()
    
    private func setup(){
        addSubview(searchShadowView)
        searchShadowView.addSubview(search)
        addSubview(QRButton)
        
    
        
        searchShadowView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.right.equalTo(QRButton.snp.left).offset(-20)
        }
        
        search.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        QRButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.right.equalToSuperview()
            
        }
    }
    
}

extension SearchContainerView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.search.resignFirstResponder()
    }
}
