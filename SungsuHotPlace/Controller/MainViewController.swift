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
    
    let favoriteVC = FavoriteViewController()
    var cafeInfoList = CafeList()
    let cafeManager = CafeManager.shared

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: FlexibleLayout())
    
    private var imageArray: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        searchMethod()
        makeImage()
        configure()
        autoLayout()
    }
    
    func searchMethod() {
        if #available(iOS 11.0, *) {
            let sc = UISearchController(searchResultsController: nil)
            sc.delegate = self
            let scb = sc.searchBar
            scb.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            scb.barTintColor = UIColor.white
            sc.obscuresBackgroundDuringPresentation = false
            
            if let textfield = scb.value(forKey: "searchField") as? UITextField {
                textfield.textColor = UIColor.blue
                textfield.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                if let backgroundview = textfield.subviews.first {
                    
                    // Background color
                    backgroundview.backgroundColor = UIColor.white
                    
                    // Rounded corner
                    backgroundview.layer.cornerRadius = 10;
                    backgroundview.clipsToBounds = true;
                }
            }
            
            if let navigationbar = self.navigationController?.navigationBar {
                navigationbar.barTintColor = .white
            }
            navigationItem.searchController = sc
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
//        cafeList = cafeList.filter {
//            // lowercased : 소문자로 변환
//            return $0.cafeName.lowercased().contains(searchText.lowercased())
//        }
        
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
        return cafeInfoList.cafeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! MainCollectionViewCell
        
        cell.imageView.image = UIImage(named: cafeInfoList.cafeName[indexPath.row])
        cell.titleLabel.text = cafeInfoList.cafeItems[indexPath.row].cafeName
        cell.contentlabel.text = cafeInfoList.cafeItems[indexPath.row].cafeDesc
        
        return cell
    }
}

extension MainViewController : FlexibleLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        let heightRatio = UIImage(named: cafeInfoList.cafeName[indexPath.item])!.size.height / UIImage(named: cafeInfoList.cafeName[indexPath.item])!.size.width
        
        return heightRatio * ((view.frame.width + 60) / 2 )
    }
    
}

extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
}

extension MainViewController: UISearchControllerDelegate {
    
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        //        filterContentForSearchText(searchBar.text!)
    }
}
