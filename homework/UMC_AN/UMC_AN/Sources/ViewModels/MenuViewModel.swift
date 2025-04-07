//
//  HomeViewModel.swift
//  UMC_AN
//
//  Created by 안승현 on 4/7/25.
//

import Foundation
import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var userName: String
    @Published var menuItems: [Menu] = [
        Menu(name: "에스프레소 콘 파나", imageName: "espresso_conpana"),
        Menu(name: "에스프레소 마끼아또", imageName: "espresso_macchiato"),
        Menu(name: "아이스 카페 아메리카노", imageName: "ice_americano"),
        Menu(name: "카페 아메리카노", imageName: "americano"),
        Menu(name: "아이스 카라멜 마끼아또", imageName: "ice_caramel_macchiato"),
        Menu(name: "카라멜 마끼아또", imageName: "caramel_macchiato")
    ]
    
    init() {
        self.userName = UserDefaults.standard.string(forKey: "nickname") ?? "(설정 닉네임)"
    }
    var displayName: String {
        return userName
    }
}

