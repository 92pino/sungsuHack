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
    
    let userDefaults = UserDefaults.standard
    
    var cafeItems: [CafeItem] = [
        Cafe(cafeName: "어니언", cafeDesc: "분위기 좋은", cafeLocation: "성동구 아차산로9길 8", cafeGeo: .init(latitude: 37.544786, longitude: 127.058119), images: ["어니언01", "어니언02", "어니언03"], favorite: false),
        Cafe(cafeName: "대림창고", cafeDesc: "창고형 카페", cafeLocation: "성동구 성수이로 78", cafeGeo: .init(latitude: 37.5419534, longitude: 127.0562899), images: ["대림창고1", "대림창고2", "대림창고3"], favorite: false),
        Cafe(cafeName: "테스트카페", cafeDesc: "테스트 카페", cafeLocation: "성동구 성수이로 78", cafeGeo: .init(latitude: 37.5419534, longitude: 127.0562899), images: ["대림창고1", "대림창고2", "대림창고3"], favorite: false),
        Cafe(cafeName: "테스트카페2", cafeDesc: "테스트 카페", cafeLocation: "성동구 성수이로 78", cafeGeo: .init(latitude: 37.5419534, longitude: 127.0562899), images: ["대림창고1", "대림창고2", "대림창고3"], favorite: false),
        Cafe(cafeName: "테스트카페3", cafeDesc: "테스트 카페", cafeLocation: "성동구 성수이로 78", cafeGeo: .init(latitude: 37.5419534, longitude: 127.0562899), images: ["대림창고1", "대림창고2", "대림창고3"], favorite: false),
    ]
    
    
    //    let cafeName: [String]
    
    //    var favorites: [ String : Bool ] = [:]
    
    init() {
        //        let cafeList = CafeList()
        //        self.cafeName = cafeList.cafeName
    }
    
    func favoriteCafe(title: String) {
        
//        for x in cafeItems {
//            var temp = x
//            if temp.cafeName == title {
//
//                temp.favorite = true
//            }
//        }
        
        for x in 0...cafeItems.count-1{
            if cafeItems[x].cafeName == title {
                cafeItems[x].favorite = true
            }
        }
    }
    
    func unfavoriteCafe(title: String) {
        for x in 0...cafeItems.count-1{
            if cafeItems[x].cafeName == title {
                cafeItems[x].favorite = false
            }
        }

    }
    
}
