//
//  BreadViewModel.swift
//  UMC_AN
//
//  Created by 안승현 on 4/7/25.
//

import Foundation

class BreadViewModel: ObservableObject {
    @Published var menuItems: [Menu] = [
        Menu(name: "너티 크루아상", imageName: "bread1"),
        Menu(name: "매콤 소시지 불고기", imageName: "bread2"),
        Menu(name: "미니 리프 파이", imageName: "bread3"),
        Menu(name: "뺑 오 쇼콜라", imageName: "bread4"),
        Menu(name: "소시지&올리브 파이", imageName: "bread5")
    ]
}
