//
//  SignupViewModel.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/30.
//

import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var signup: SignupModel = SignupModel()
    @AppStorage("userNickname") private var storedNickname: String = ""
    @AppStorage("userEmail") private var storedEmail: String = ""
    @AppStorage("userPassword") private var storedPassword: String = ""
    func saveUserData() {
        storedNickname = signup.nickname
        storedEmail = signup.email
        storedPassword = signup.password
    }
}
