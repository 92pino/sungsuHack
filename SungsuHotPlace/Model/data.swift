//
//  data.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 22/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class BountyInfo {
    var category: String
    var name: String
    var desc: String
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(category: String, name: String, desc: String) {
        self.category = category
        self.name = name
        self.desc = desc
    }
}
