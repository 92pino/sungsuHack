//
//  MainCollectionViewCell.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 22/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let contentlabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuer()
        autolayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuer() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.layer.cornerRadius = 6
        contentView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        
        contentView.addSubview(titleLabel)
        
        contentlabel.numberOfLines = 0
        contentView.addSubview(contentlabel)
    }
    
    private func autolayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentlabel.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentlabel.trailingAnchor).isActive = true
        
        contentlabel.translatesAutoresizingMaskIntoConstraints = false
        contentlabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        contentlabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        contentlabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        contentlabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
