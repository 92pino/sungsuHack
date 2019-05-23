//
//  FavoriteTableViewCell.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 22/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    var img: String = ""
    var name: String = ""
    var location: String = ""
    
    var shopImage = UIImageView()
    var shopName = UILabel()
    var shopLocation = UILabel()
    
    let cafeManager = CafeManager.shared
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contentView.addSubview(shopImage)
        contentView.addSubview(shopName)
        contentView.addSubview(shopLocation)
        autoLayout()
    }
    
    func autoLayout() {
        let guide = contentView.safeAreaLayoutGuide
        shopImage.translatesAutoresizingMaskIntoConstraints = false
        
        shopImage.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        shopImage.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        shopImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shopImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        shopName.translatesAutoresizingMaskIntoConstraints = false
        
        shopName.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -25).isActive = true
        shopName.leadingAnchor.constraint(equalTo: shopImage.trailingAnchor, constant: 20).isActive = true
        shopName.widthAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        
        shopLocation.translatesAutoresizingMaskIntoConstraints = false
        
        shopLocation.topAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        shopLocation.leadingAnchor.constraint(equalTo: shopName.leadingAnchor).isActive = true
        shopLocation.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
    }
    
    func setCell(_ shopImage: String, _ shopName: String, _ shopLocation: String) {
        self.shopImage.image = UIImage(named: shopImage)
        self.shopName.text = shopName
        self.shopLocation.text = shopLocation
    }
}
