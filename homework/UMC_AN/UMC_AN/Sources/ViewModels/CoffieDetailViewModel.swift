//
//  CoffieDetailViewModel.swift
//  UMC_AN
//
//  Created by 안승현 on 4/7/25.
//

import Foundation

class CoffieDetailViewModel: ObservableObject {
    @Published var CoffieDetails: [String: CoffieDetail] =
    [
        "아이스 카라멜 마끼아또": CoffieDetail(name:"아이스 카라멜 마끼아또", en_name: "Iced Caramel Macchiato", imagename: "caramerlCold", description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료", price: "6100", temper: .ice),
        "카라멜 마끼아또": CoffieDetail(name:"카라멜 마끼아또", en_name: "Caramel Macchiato", imagename: "caramelHot", description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료", price: "6100", temper: .hot),
        "아이스 카페 아메리카노": CoffieDetail(name:"아이스 카페 아메리카노", en_name: "Iced Caffe Americano", imagename: "americanoCold", description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피", price: "4700", temper: .ice),
        "카페 아메리카노": CoffieDetail(name:"카페 아메리카노", en_name: "americanoHot", imagename: "americanoHot", description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피", price: "4700", temper: .hot),
        "에스프레소 콘 파나": CoffieDetail(name:"에스프레소 콘 파나", en_name: "Espresso Con Panna", imagename: "confana", description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료", price: "4100", temper: .hotonly),
        "에스프레소 마끼아또": CoffieDetail(name:"에스프레소 마끼아또", en_name: "Espresso Macchiato", imagename: "macchiato", description: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료", price: "3900", temper: .iceonly)
        
        
    ]
}
