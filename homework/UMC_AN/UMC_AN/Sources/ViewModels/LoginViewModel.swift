//
//  LoginViewModel.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var user: UserModel = UserModel()
    
    func login() {
        print("로그인 시도: \(user.user_id)")
    }
}
