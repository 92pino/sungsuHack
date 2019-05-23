//
//  MainTabBarController.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 22/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let homeVC = MainViewController()
    let favoriteVC = FavoriteViewController()
    let mapVC = MapViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        
        tabBar.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tabBar.barTintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        // 탭바 위에 뷰컨트롤러 올리기
        
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: AppImageData.home), selectedImage: UIImage(named: AppImageData.homeSelected))
        mapVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: AppImageData.home), selectedImage: UIImage(named: AppImageData.homeSelected))
        favoriteVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: AppImageData.home), selectedImage: UIImage(named: AppImageData.homeSelected))
        
        // homeVC에 네비게이션 적용시키기
        viewControllers = [UINavigationController.init(rootViewController: homeVC), mapVC,  UINavigationController.init(rootViewController: favoriteVC)]
        
        self.delegate = self
        
        // 탭바 타이틀 공간 없애기
        for i in tabBar.items! {
            i.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
    
}
