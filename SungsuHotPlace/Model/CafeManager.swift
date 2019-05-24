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
        Cafe(cafeName: "어니언", cafeDesc: "맛있는 팡도르 빵과 분위기", cafeLocation: "성동구 아차산로9길 8", cafeGeo: .init(latitude: 37.544786, longitude: 127.058119), images: ["어니언01", "어니언02", "어니언03", "어니언04", "어니언05", "어니언06", "어니언07", "어니언08", "어니언09", "어니언10"], favorite: false),
        Cafe(cafeName: "대림창고", cafeDesc: "창고형 분위기좋은 카페", cafeLocation: "성동구 성수이로 78", cafeGeo: .init(latitude: 37.5419534, longitude: 127.0562899), images: ["대림창고01", "대림창고02", "대림창고03", "대림창고04", "대림창고05", "대림창고06", "대림창고07", "대림창고08", "대림창고09", "대림창고10"], favorite: false),
        Cafe(cafeName: "어반소스", cafeDesc: "분위기 좋은 카페 겸 레스토랑", cafeLocation: "성동구 성수2가3동 연무장3길 9", cafeGeo: .init(latitude: 37.5445466, longitude: 127.05122949999998), images: ["어반소스01", "어반소스02", "어반소스03", "어반소스04", "어반소스05", "어반소스06", "어반소스07", "어반소스08", "어반소스09", "어반소스10"], favorite: false),
        Cafe(cafeName: "감성다방", cafeDesc: "감성가득한 분위기", cafeLocation: "광진구 화양동 94-7", cafeGeo: .init(latitude: 37.5457422, longitude: 127.07300529999998), images: ["감성다방01", "감성다방02", "감성다방03", "감성다방04", "감성다방05", "감성다방06", "감성다방07", "감성다방08", "감성다방09", "감성다방10"], favorite: false),
        Cafe(cafeName: "천상가옥", cafeDesc: "복합문화공간 성수연방", cafeLocation: "성동구 성수동2가 성수이로14길 14", cafeGeo: .init(latitude: 37.5414775, longitude: 127.05694889999995), images: ["천상가옥01", "천상가옥02", "천상가옥03", "천상가옥04", "천상가옥05", "천상가옥06", "천상가옥07", "천상가옥08", "천상가옥09", "천상가옥10"], favorite: false),
        Cafe(cafeName: "센터커피", cafeDesc: "커피가 맛있는 서울숲 카페", cafeLocation: "성동구 서울숲2길 28-11", cafeGeo: .init(latitude: 37.5464894, longitude: 127.04165260000002), images: ["센터커피01", "센터커피02", "센터커피03", "센터커피04", "센터커피05", "센터커피06", "센터커피07", "센터커피08", "센터커피09", "센터커피10"], favorite: false),
        Cafe(cafeName: "블랙별", cafeDesc: "도심 속 조용한 아지트", cafeLocation: "성동구 성수일로12길 20", cafeGeo: .init(latitude: 37.5482173, longitude: 127.05334790000006), images: ["블랙별01", "블랙별02", "블랙별03", "블랙별04", "블랙별05", "블랙별06", "블랙별07", "블랙별08", "블랙별09", "블랙별10"], favorite: false),
        Cafe(cafeName: "오르에르", cafeDesc: "뒷마당이 예쁜 카페", cafeLocation: "성동구 연무장길 18", cafeGeo: .init(latitude: 37.5434188, longitude: 127.05137400000001), images: ["오르에르01", "오르에르02", "오르에르03", "오르에르04", "오르에르05", "오르에르06", "오르에르07", "오르에르08", "오르에르09", "오르에르10"], favorite: false),
        Cafe(cafeName: "쉐어드테이블", cafeDesc: "감성 분위기 갑 카페", cafeLocation: "성동구 연무장길 47", cafeGeo: .init(latitude: 37.5427671, longitude: 127.05471929999999), images: ["쉐어드테이블01", "쉐어드테이블02", "쉐어드테이블03", "쉐어드테이블04", "쉐어드테이블05", "쉐어드테이블06", "쉐어드테이블07", "쉐어드테이블08", "쉐어드테이블09", "쉐어드테이블10"], favorite: false),
        Cafe(cafeName: "인덱스카라멜", cafeDesc: "직접만드는 수제 카라멜", cafeLocation: "성동구 성수이로 78", cafeGeo: .init(latitude: 37.5414775, longitude: 127.05694889999995), images: ["인덱스카라멜01", "인덱스카라멜02", "인덱스카라멜03", "인덱스카라멜04", "인덱스카라멜05", "인덱스카라멜06", "인덱스카라멜07", "인덱스카라멜08", "인덱스카라멜09", "인덱스카라멜10"], favorite: false),
        
        Cafe(cafeName: "장미맨숀", cafeDesc: "뚝섬 사진찍기 좋은 카페", cafeLocation: "성동구 서울숲2길 22-2", cafeGeo: .init(latitude: 37.5468635, longitude: 127.04112269999996), images: ["장미맨숀01", "장미맨숀02", "장미맨숀03", "장미맨숀04", "장미맨숀05", "장미맨숀06", "장미맨숀07", "장미맨숀08", "장미맨숀09", "장미맨숀10"], favorite: false),
        Cafe(cafeName: "도렐커피", cafeDesc: "제주도에서 올라온 육지 3호점", cafeLocation: "성동구 성수2가3동 314 12", cafeGeo: .init(latitude: 37.5438046, longitude: 127.05432369999994), images: ["도렐커피01", "도렐커피02", "도렐커피03", "도렐커피04", "도렐커피05", "도렐커피06", "도렐커피07", "도렐커피08", "도렐커피09", "도렐커피10"], favorite: false),
        Cafe(cafeName: "트와블루", cafeDesc: "마당이 예쁜 카페", cafeLocation: "성동구 서울숲6길 11-1", cafeGeo: .init(latitude: 37.5476749, longitude: 127.04306670000005), images: ["트와블루01", "트와블루02", "트와블루03", "트와블루04", "트와블루05", "트와블루06", "트와블루07", "트와블루08", "트와블루09", "트와블루10"], favorite: false),
        Cafe(cafeName: "빌로우성수", cafeDesc: "모단한 느낌의 카페", cafeLocation: "성동구 서울숲4길 16-10", cafeGeo: .init(latitude: 37.5471689, longitude: 127.04244169999993), images: ["빌로우성수01", "빌로우성수02", "빌로우성수03", "빌로우성수04", "빌로우성수05", "빌로우성수06", "빌로우성수07", "빌로우성수08", "빌로우성수09", "빌로우성수10"], favorite: false),
        Cafe(cafeName: "플레이스비브", cafeDesc: "파스타가 맛있는 카페", cafeLocation: "성동구 아차산로7나길 14", cafeGeo: .init(latitude: 37.5478583, longitude: 127.05690249999998), images: ["플레이스비브01", "플레이스비브02", "플레이스비브03", "플레이스비브04", "플레이스비브05", "플레이스비브06", "플레이스비브07", "플레이스비브08", "플레이스비브09", "플레이스비브10"], favorite: false),
        Cafe(cafeName: "담향커피", cafeDesc: "여유롭고 따뜻한 분위기", cafeLocation: "성동구 성수이로7가길 13", cafeGeo: .init(latitude: 37.5414092, longitude: 127.05504989999997), images: ["담향커피01", "담향커피02", "담향커피03", "담향커피04", "담향커피05", "담향커피06", "담향커피07", "담향커피08", "담향커피09", "담향커피10"], favorite: false),
        Cafe(cafeName: "그레이트커피", cafeDesc: "서울숲 분위기좋은 카페", cafeLocation: "성동구 서울숲2길 6", cafeGeo: .init(latitude: 37.5476319, longitude: 127.03965530000005), images: ["그레이트커피01", "그레이트커피02", "그레이트커피03", "그레이트커피04", "그레이트커피05", "그레이트커피06", "그레이트커피07", "그레이트커피08", "그레이트커피09", "그레이트커피10"], favorite: false),
        Cafe(cafeName: "카페앤아더", cafeDesc: "성수동 핫플 수영장 카페", cafeLocation: "성동구 서울숲2길 40-10", cafeGeo: .init(latitude: 37.54625, longitude: 127.04279640000004), images: ["카페앤아더01", "카페앤아더02", "카페앤아더03", "카페앤아더04", "카페앤아더05", "카페앤아더06", "카페앤아더07", "카페앤아더08", "카페앤아더09", "카페앤아더10"], favorite: false),
        Cafe(cafeName: "카페라잌유", cafeDesc: "서울숲 근처 감성 카페", cafeLocation: "성동구 왕십리로8길 21-1", cafeGeo: .init(latitude: 37.5460185, longitude: 127.04714490000003), images: ["카페라잌유01", "카페라잌유02", "카페라잌유03", "카페라잌유04", "카페라잌유05", "카페라잌유06", "카페라잌유07", "카페라잌유08", "카페라잌유09", "카페라잌유10"], favorite: false),
        Cafe(cafeName: "블루보틀", cafeDesc: "블루보틀커피 성수 한국1호점", cafeLocation: "성동구 아차산로 7", cafeGeo: .init(latitude: 37.5472123, longitude: 127.05498209999996), images: ["블루보틀01", "블루보틀02", "블루보틀03", "블루보틀04", "블루보틀05", "블루보틀06", "블루보틀07", "블루보틀08", "블루보틀09", "블루보틀10"], favorite: false),
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
