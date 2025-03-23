//
//  UserViewModel.swift
//  umc-0
//
//  Created by 안승현 on 2025/03/17.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var userModel: UserModel
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
    
    func increaseAge() {
        self.userModel.increaseAge()
    }
    
    func decreaseAge() {
        self.userModel.decreaseAge()
    }
    
}
