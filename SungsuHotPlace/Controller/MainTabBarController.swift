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
        
        tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.6903355013, green: 0.6903355013, blue: 0.6903355013, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        // 탭바 위에 뷰컨트롤러 올리기
        
        homeVC.tabBarItem = UITabBarItem(title: "성수핫플", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_active"))
        mapVC.tabBarItem = UITabBarItem(title: "핫플성지", image: UIImage(named: "map"), selectedImage: UIImage(named: "map_active"))
        favoriteVC.tabBarItem = UITabBarItem(title: "나의 즐겨찾기", image: UIImage(named: "fav"), selectedImage: UIImage(named: "fav_active"))
        
        // homeVC에 네비게이션 적용시키기
        viewControllers = [UINavigationController.init(rootViewController: homeVC), mapVC,  UINavigationController.init(rootViewController: favoriteVC)]
        
        self.delegate = self
        
        // 탭바 타이틀 공간 없애기
        for i in tabBar.items! {
            tabBarItem.title = ""
            i.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }

    }
    
}
