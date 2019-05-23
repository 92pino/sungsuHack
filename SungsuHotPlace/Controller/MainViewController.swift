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
    let sc = UISearchController(searchResultsController: nil)
    
    let detailVC = DetailViewController()
    let cafeManager = CafeManager.shared
    var cafeList = CafeManager.shared.cafeItems
    var filterData = [CafeItem]()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: FlexibleLayout())
    
    private var imageArray: [UIImage] = []
    
    var test: Bool {
        return UserDefaults.standard.bool(forKey: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "성수핫플"
        
        searchMethod()
//        makeImage()
        configure()
        autoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cafeList = cafeManager.cafeItems
        collectionView.reloadData()
        navigationItem.searchController = sc
    }
    
    func searchMethod() {
        if #available(iOS 11.0, *) {
            let scb = sc.searchBar
            scb.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            scb.barTintColor = UIColor.white
            sc.searchResultsUpdater = self
            sc.obscuresBackgroundDuringPresentation = false
            sc.searchBar.delegate = self
            definesPresentationContext = true
            
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
        
        filterData = cafeList.filter {
            return $0.cafeName.contains(searchText) || $0.cafeDesc.lowercased().contains(searchText.lowercased())
        }
        print(filterData)
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.layoutIfNeeded()
        collectionView.reloadData()
    }
    
    
//    private func makeImage() {
//        for i in 1...6 {
//            let image = UIImage(named: "0\(i)")
//            imageArray.append(image!)
//        }
//    }
    
    func configure() {
        if let layout = collectionView.collectionViewLayout as? FlexibleLayout {
            layout.delegate = self
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "image")
        view.addSubview(collectionView)
        
        // pull to Refresh
//        let refreshControl = UIRefreshControl()
//        collectionView.alwaysBounceVertical = true
//        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        // refreshControl 색상 변경
//        refreshControl.tintColor = .blue
//        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
//        collectionView.refreshControl = refreshControl
    }
    
    @objc func reloadData() {
        filterData = cafeManager.cafeItems.shuffled()
//        data.reverse()
        // reverse를 몰랐을 경우 for문 이용
        
        // reload가 끝났을 경우
        collectionView.refreshControl?.endRefreshing()
        collectionView.reloadData()
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
        if sc.isActive && !sc.searchBar.text!.isEmpty {
            return filterData.count
        }
        return cafeManager.cafeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! MainCollectionViewCell
        if sc.isActive && !sc.searchBar.text!.isEmpty{
            cell.imageView.image = UIImage(named: filterData[indexPath.row].cafeName)
            cell.titleLabel.text = filterData[indexPath.row].cafeName
            cell.contentlabel.text = filterData[indexPath.row].cafeDesc
            cell.checkFavorite = filterData[indexPath.row].favorite
        }
        cell.imageView.image = UIImage(named: cafeManager.cafeItems[indexPath.row].cafeName)
        cell.titleLabel.text = cafeManager.cafeItems[indexPath.row].cafeName
        cell.contentlabel.text = cafeManager.cafeItems[indexPath.row].cafeDesc
        cell.checkFavorite = cafeManager.cafeItems[indexPath.row].favorite
        return cell
    }
    
    
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
//        present(detailVC, animated: true)
    }
}

extension MainViewController : FlexibleLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        if sc.isActive && !sc.searchBar.text!.isEmpty{
            let heightRatio = UIImage(named: filterData[indexPath.item].cafeName)!.size.height / UIImage(named: filterData[indexPath.item].cafeName)!.size.width
            return heightRatio * ((view.frame.width + 60) / 2 )

        }
        let heightRatio = UIImage(named: cafeManager.cafeItems[indexPath.item].cafeName)!.size.height / UIImage(named: cafeManager.cafeItems[indexPath.item].cafeName)!.size.width
            return heightRatio * ((view.frame.width + 60) / 2 )
    }
        
    
}

extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print("검색중")
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}



