//
//  favorite.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 22/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class Favorite {
    var shopImage: UIImage
    var shopName: String
    var shopLocation: String
    var favoriteMark: Bool
    
    init(shopImage: UIImage, shopName: String, shopLocation: String, favoriteMark: Bool) {
        self.shopImage = shopImage
        self.shopName = shopName
        self.shopLocation = shopLocation
        self.favoriteMark = favoriteMark
    }
}
