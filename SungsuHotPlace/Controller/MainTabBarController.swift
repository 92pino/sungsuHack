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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        
        // 탭바 위에 뷰컨트롤러 올리기
        
        homeVC.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home_active"))
        favoriteVC.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "favorite"), selectedImage: #imageLiteral(resourceName: "favorite_active"))
        
        // homeVC에 네비게이션 적용시키기
        viewControllers = [UINavigationController.init(rootViewController: homeVC), UINavigationController.init(rootViewController: favoriteVC)]
        
        self.delegate = self
        
        // 탭바 타이틀 공간 없애기
        for i in tabBar.items! {
            i.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
    
}
