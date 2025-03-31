//
//  SignupModel.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/30.
//

import Foundation
import SwiftUI

class SignupModel: ObservableObject {
    @Published var nickname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
}
