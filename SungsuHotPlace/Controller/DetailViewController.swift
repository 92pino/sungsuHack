//
//  DetailViewController.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 23/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let cafeManager = CafeManager.shared
    
    var cafeName: String!
    
    let dissmissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back-button"), for: .normal)
        return button
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "상세보기"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    let instaConnectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("    인스타그램에서 더 둘러보기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.contentHorizontalAlignment = .left
        button.layer.cornerRadius = 6
        return button
    }()
    
    let arrowButton: UIButton = {
        let arrow = UIButton()
        arrow.setImage(UIImage(named: "instabutton"), for: .normal)
        return arrow
    }()
    
    let belowView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 10
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        return label
    }()
    
    let grayLine: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        return view
    }()
    
    let addressButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitleColor(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1), for: .normal)
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .left
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.titleLabel?.textColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        return button
    }()
    
    let favoriteMark: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: AppImageData.favoriteSelected), for: .selected)
        button.setBackgroundImage(UIImage(named: AppImageData.favorite), for: .normal)
        button.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        return button
    }()
    
    var checkFavorite: Bool = false {
        didSet {
            favoriteMark.isSelected = checkFavorite
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let content = cafeManager.cafeItems.filter { $0.cafeName == self.cafeName }
        
        titleLabel.text = content.first?.cafeName
        contentLabel.text = content.first?.cafeDesc
        addressButton.setTitle(content.first?.cafeLocation, for: .normal)
        
        addSubview()
        autoLayout()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }
    
    private func addSubview() {
        view.addSubview(mainLabel)
        view.addSubview(dissmissButton)
        view.addSubview(collectionView)
        view.addSubview(instaConnectButton)
        view.addSubview(belowView)
        view.addSubview(grayLine)
        
        belowView.addSubview(titleLabel)
        belowView.addSubview(contentLabel)
        belowView.addSubview(addressButton)
        belowView.addSubview(favoriteMark)
        favoriteMark.addTarget(self, action: #selector(favoriteChk(_:)), for: .touchUpInside)
        
        dissmissButton.addTarget(self, action: #selector(viewDismiss(_:)), for: .touchUpInside)
        instaConnectButton.addSubview(arrowButton)
        instaConnectButton.addTarget(self, action: #selector(instagramConect(_:)), for: .touchUpInside)
        
        addressButton.addTarget(self, action: #selector(goToKakaoMap(_:)), for: .touchUpInside)
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 5).isActive = true
        mainLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        
        dissmissButton.translatesAutoresizingMaskIntoConstraints = false
        dissmissButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 5).isActive = true
        dissmissButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 5).isActive = true
        dissmissButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dissmissButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 50).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.55).isActive = true
        
        instaConnectButton.translatesAutoresizingMaskIntoConstraints = false
        instaConnectButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20).isActive = true
        instaConnectButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 15).isActive = true
        instaConnectButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -15).isActive = true
        instaConnectButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
        arrowButton.trailingAnchor.constraint(equalTo: instaConnectButton.trailingAnchor, constant: -10).isActive = true
        arrowButton.centerYAnchor.constraint(equalTo: instaConnectButton.centerYAnchor).isActive = true
        arrowButton.topAnchor.constraint(equalTo: instaConnectButton.topAnchor, constant: 10).isActive = true
        arrowButton.bottomAnchor.constraint(equalTo: instaConnectButton.bottomAnchor, constant: -10).isActive = true
        
        belowView.translatesAutoresizingMaskIntoConstraints = false
        belowView.topAnchor.constraint(equalTo: instaConnectButton.bottomAnchor, constant: 20).isActive = true
        belowView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 15).isActive = true
        belowView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -15).isActive = true
        belowView.heightAnchor.constraint(equalToConstant: 135).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: belowView.topAnchor, constant: 15).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: belowView.leadingAnchor, constant: 15).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: belowView.leadingAnchor, constant: 15).isActive = true
        contentLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        contentLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        grayLine.translatesAutoresizingMaskIntoConstraints = false
        grayLine.topAnchor.constraint(equalTo: belowView.topAnchor, constant: 85).isActive = true
        grayLine.leadingAnchor.constraint(equalTo: belowView.leadingAnchor, constant: 15).isActive = true
        grayLine.trailingAnchor.constraint(equalTo: belowView.trailingAnchor, constant: -15).isActive = true
        grayLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addressButton.translatesAutoresizingMaskIntoConstraints = false
        addressButton.topAnchor.constraint(equalTo: grayLine.bottomAnchor, constant: 10).isActive = true
        addressButton.leadingAnchor.constraint(equalTo: belowView.leadingAnchor, constant: 15).isActive = true
        addressButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        addressButton.trailingAnchor.constraint(equalTo: belowView.trailingAnchor, constant: -15).isActive = true
        
        favoriteMark.translatesAutoresizingMaskIntoConstraints = false
        favoriteMark.topAnchor.constraint(equalTo: belowView.topAnchor, constant: 25).isActive = true
        favoriteMark.trailingAnchor.constraint(equalTo: belowView.trailingAnchor, constant: -20).isActive = true
        favoriteMark.heightAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteMark.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    private func configure() {
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCollectionViewCell")
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
    }
    
    @objc func viewDismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @objc func instagramConect(_ sender: UIButton) {
        let content = cafeManager.cafeItems.filter { $0.cafeName == self.cafeName }
        var str = content.first?.cafeName
        var urlStr = "instagram://tag?name=\(str!)"
        let encoded = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let instagram = URL(string: encoded)!
        print(instagram)
        
        guard UIApplication.shared.canOpenURL(instagram) else { return }
        UIApplication.shared.open(instagram)
    }
    
    @objc func goToKakaoMap(_ sender: UIButton) {
        let content = cafeManager.cafeItems.filter { $0.cafeName == self.cafeName }
        
        var latitude = content.first?.cafeGeo.latitude
        var longitude = content.first?.cafeGeo.longitude
        
        var urlStr = "kakaomap://look?p=\(latitude!),\(longitude!)"
        let encoded = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let instagram = URL(string: urlStr)!
        guard UIApplication.shared.canOpenURL(instagram) else { return }
        UIApplication.shared.open(instagram)
    }
    
    @objc func favoriteChk(_ sender: UIButton) {
        if sender.isSelected {
            favoriteMark.isSelected = false
            cafeManager.unfavoriteCafe(title: self.titleLabel.text!)
        } else {
            favoriteMark.isSelected = true
            cafeManager.favoriteCafe(title: self.titleLabel.text!)
        }
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cafeManager.cafeItems[section].images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        
        let fav = cafeManager.cafeItems.filter { $0.cafeName == self.cafeName }
        let array = fav.first?.images
        
        cell.imageView.image = UIImage(named: (array?[indexPath.row])!)
        
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height * 0.5)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        return 0
    }
    
    //셀 사이의 간격
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        return 0
    }
}
