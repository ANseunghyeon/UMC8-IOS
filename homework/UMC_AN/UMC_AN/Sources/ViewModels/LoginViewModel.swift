//
//  LoginViewModel.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/23.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var user = UserModel()
    @Published var isLoggedIn = false
    
    @AppStorage("userEmail") private var storedEmail: String = ""
    @AppStorage("userPassword") private var storedPassword: String = ""
    @AppStorage("userNickname") private var storedNickname: String = ""
    @AppStorage("isLoggedIn") var isUserLoggedIn: Bool = false
    
    @Published var userNickname: String = ""
    
    func login() -> Bool {
        if user.user_id == storedEmail && user.user_pwd == storedPassword {
            isLoggedIn = true
            isUserLoggedIn = true
            userNickname = storedNickname
            return true
        }
        return false
    }
}
