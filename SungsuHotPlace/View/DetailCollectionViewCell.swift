//
//  DetailCollectionViewCell.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 24/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    let identifier = "DetailCollectionViewCell"
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview()
        autoLayout()
        configure()
        
        imageView.contentMode = .scaleAspectFill
    }
    
    func addSubview() {
        contentView.addSubview(imageView)
    }
    
    func autoLayout() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func configure() {
        imageView.backgroundColor = #colorLiteral(red: 0.460631609, green: 0.8378008604, blue: 0.9999235272, alpha: 1)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
