//
//  data.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 22/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import MapKit

protocol CafeItem {
    var cafeName: String { get }
    var cafeDesc: String { get }
    var cafeLocation: String  { get }
    var cafeGeo: CLLocationCoordinate2D { get }
    var images: [String] { get }
}

struct Cafe: CafeItem {
    var cafeName: String
    var cafeDesc: String
    var cafeLocation: String
    var cafeGeo: CLLocationCoordinate2D
    var images: [String]
}
