//
//  GridCell.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 23/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation
import UIKit

class GridCell: UICollectionViewCell {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let contentlabel = UILabel()
    let favoriteMark = UIButton(type: .system)
    
    
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
        imageView.layer.cornerRadius = 6
        contentView.addSubview(imageView)
        
        contentView.addSubview(titleLabel)
        
        //    contentlabel.numberOfLines = 0
        contentView.addSubview(contentlabel)
        contentlabel.font = contentlabel.font.withSize(12)
        
        
        favoriteMark.addTarget(self, action: #selector(favoriteChk(_:)), for: .touchUpInside)
        favoriteMark.setBackgroundImage(UIImage(named: "favorite"), for: .normal)
        //    favoriteMark.backgroundColor = .red
        contentView.addSubview(favoriteMark)
        favoriteMark.isHighlighted = false
    }
    
    @objc func favoriteChk(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = true
            sender.setBackgroundImage(UIImage(named: "favorite_active"), for: .normal)
            //      sender.isHighlighted = false
            sender.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        } else {
            sender.isSelected = false
            sender.setBackgroundImage(UIImage(named: "favorite"), for: .normal)
            //      sender.isHighlighted = false
            sender.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        }
    }
    
    private func autolayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentlabel.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentlabel.trailingAnchor).isActive = true
        
        contentlabel.translatesAutoresizingMaskIntoConstraints = false
        contentlabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        contentlabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        contentlabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        contentlabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        favoriteMark.translatesAutoresizingMaskIntoConstraints = false
        favoriteMark.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        favoriteMark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        //    favoriteMark.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        favoriteMark.widthAnchor.constraint(equalToConstant: 18).isActive = true
        favoriteMark.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
}
