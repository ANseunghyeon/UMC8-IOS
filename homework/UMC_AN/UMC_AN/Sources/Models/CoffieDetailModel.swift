//
//  CoffieDetailModel.swift
//  UMC_AN
//
//  Created by 안승현 on 4/7/25.
//

import Foundation
import SwiftUI

struct CoffieDetail: Identifiable{
    var id = UUID()
    var name: String
    var en_name: String
    var imagename: String
    var description: String
    var price: String
    var temper: Temper
}

enum Temper: String{
    case hot = "HOT"
    case ice = "ICED"
    case hotonly = "HOT ONLY"
    case iceonly = "ICE ONLY"
    

    var isChangeable: Bool {
        switch self {
        case .hot, .ice: return true
        case .hotonly, .iceonly: return false
        }
    }
    

    var textColor: Color {
        switch self {
        case .hot, .hotonly: return .red01
        case .ice, .iceonly: return .blue01
        }
    }

    static var selectableOptions: [Temper] {
        [.hot, .ice]
    }
}
