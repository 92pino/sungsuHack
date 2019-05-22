//
//  ViewController.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 22/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

private struct Standard {
    static let space: CGFloat = 10
}
class MainViewController: UIViewController {
    
    var cafeList = bountyInfoList
    let searchController = UISearchController(searchResultsController: nil)
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: FlexibleLayout())
    
    private var imageArray: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "로고영역"
        
        searchMethod()
        makeImage()
        configure()
        autoLayout()
    }
    
    func searchMethod() {
        // Setup Basic SearchController Setting
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        // Setup other SearchController Setting
        
        searchController.searchBar.placeholder = "Search Cafe"
        
        // 검색 할 때 배경을 어둡게 할지 밝게할지
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        cafeList = cafeList.filter {
            // lowercased : 소문자로 변환
            return $0.name.lowercased().contains(searchText.lowercased())
        }
        
        collectionView.reloadData()
    }
    
    
    private func makeImage() {
        for i in 1...6 {
            let image = UIImage(named: "0\(i)")
            imageArray.append(image!)
        }
    }
    
    private func configure() {
        if let layout = collectionView.collectionViewLayout as? FlexibleLayout {
            layout.delegate = self
        }
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "image")
        view.addSubview(collectionView)
    }
    
    private func autoLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! MainCollectionViewCell
        
        cell.imageView.image = imageArray[indexPath.row]
        print(bountyInfoList[indexPath.row].name)
        cell.titleLabel.text = bountyInfoList[indexPath.row].name
        cell.contentlabel.text = bountyInfoList[indexPath.row].desc
        
        return cell
    }
}

extension MainViewController : FlexibleLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return imageArray[indexPath.item].size.height
    }
    
}

extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        //        filterContentForSearchText(searchBar.text!)
    }
}
