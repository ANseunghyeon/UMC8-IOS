//
//  LoginModel.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/23.
//

import Foundation

class UserModel: ObservableObject{
    @Published var user_id: String = ""
    @Published var user_pwd: String = ""
}
