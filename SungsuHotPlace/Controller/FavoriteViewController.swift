//
//  FavoriteViewController.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 22/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    let cafeManager = CafeManager.shared
    var favoriteDataArr = [Favorite]()
    var cafeInfoList = CafeList()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "나의 즐겨찾기"
        print(2222)
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        print(cafeManager.favorites.keys)
        
        tableView.reloadData()
    }
    
    func configure() {
        view.addSubview(tableView)
        autoLayout()
        tableViewConfig()
        
        tableView.dataSource = self
        tableView.rowHeight = 120
        
        let locationButton = UIButton(type: .custom)
        locationButton.setImage(UIImage(named: AppImageData.home), for: .normal)
        locationButton.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
        locationButton.addTarget(self, action:#selector(goToMap), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: locationButton)
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    // 탭바 이동 메서드
    @objc func goToMap() {
        tabBarController?.selectedIndex = 1
    }
    
    func tableViewConfig() {
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "Favorite")
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }

}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafeManager.favorites.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Favorite", for: indexPath) as! FavoriteTableViewCell
        cell.separatorInset = UIEdgeInsets.zero
        
        var title = Array(cafeManager.favorites.keys)
        cell.setCell(title[indexPath.row], title[indexPath.row], cafeInfoList.cafeItems[indexPath.row].cafeLocation)
        
        return cell
    }
}
