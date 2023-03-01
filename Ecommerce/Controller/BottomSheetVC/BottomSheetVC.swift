//
//  BottomSheetVC.swift
//  Ecommerce
//
//  Created by Константин Козлов on 10.11.2022.
//

import UIKit

final class BottomSheetVC: UIViewController{
    
    private var currentHeight: CGFloat {
        didSet {
            updatePreferredContentSize()
        }
    }
    
    private let _scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    init(initialHeight: CGFloat) {
        currentHeight = initialHeight
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updatePreferredContentSize() {
        _scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: currentHeight)
       
        preferredContentSize = _scrollView.contentSize
    }
}
