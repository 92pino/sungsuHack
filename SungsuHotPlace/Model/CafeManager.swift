//
//  model.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 22/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import MapKit
import Foundation

final class CafeManager {
    
    static let shared = CafeManager()
    
    let cafeName: [String]
    
    var favorites: [ String : Bool ] = [:]
    
    init() {
        let cafeList = CafeList()
        self.cafeName = cafeList.cafeName
    }
    
    func favoriteCafe(title: String) {
        favorites[title] = true
    }
    
    func unfavoriteCafe(title: String) {
        favorites.removeValue(forKey: title)
    }
    
    func checkFavorateList() -> [ String: Bool ] {
        return favorites
    }
    
    func resetItem() {
        self.favorites.removeAll()
    }
    
}


struct  CafeList {
    
    let cafeName = ["어니언","대림창고","테스트","10","04"]
    
    var cafeItems: [CafeItem] = [
        Cafe(cafeName: "어니언", cafeDesc: "분위기 좋은", cafeLocation: "성동구 아차산로9길 8", cafeGeo: .init(latitude: 37.544786, longitude: 127.058119), images: ["어니언01", "어니언02", "어니언03"]),
        Cafe(cafeName: "대림창고", cafeDesc: "창고형 카페", cafeLocation: "성동구 성수이로 78", cafeGeo: .init(latitude: 37.5419534, longitude: 127.0562899), images: ["대림창고1", "대림창고2", "대림창고3"]),
        Cafe(cafeName: "테스트카페", cafeDesc: "테스트 카페", cafeLocation: "성동구 성수이로 78", cafeGeo: .init(latitude: 37.5419534, longitude: 127.0562899), images: ["대림창고1", "대림창고2", "대림창고3"]),
        Cafe(cafeName: "테스트카페2", cafeDesc: "테스트 카페", cafeLocation: "성동구 성수이로 78", cafeGeo: .init(latitude: 37.5419534, longitude: 127.0562899), images: ["대림창고1", "대림창고2", "대림창고3"]),
        Cafe(cafeName: "테스트카페3", cafeDesc: "테스트 카페", cafeLocation: "성동구 성수이로 78", cafeGeo: .init(latitude: 37.5419534, longitude: 127.0562899), images: ["대림창고1", "대림창고2", "대림창고3"]),
    ]
}
