//
//  TabBarController.swift
//  Ecommerce
//
//  Created by Константин Козлов on 10.11.2022.
//

import UIKit

class TapBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar(){
        viewControllers = [
            generateVC(viewController: HomeVC(), image: UIImage(named: "bag")),
            generateVC(viewController: ProductDetailVC(), image: UIImage(named: "heart")),
            generateVC(viewController: MyCartVC(), image: UIImage(named: "man"))
            
        ]
    }
    
    private func generateVC(viewController: UIViewController, image: UIImage?)->UIViewController{
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance(){
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(
            x: positionOnX,
            y: tabBar.bounds.minY - positionOnY,
            width: width,
            height: height),
                                      cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        tabBar.tintColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        tabBar.unselectedItemTintColor = .white
    }
    
    
}
