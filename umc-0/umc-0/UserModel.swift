//
//  UserModel.swift
//  umc-0
//
//  Created by 안승현 on 2025/03/17.
//

import Foundation

struct UserModel {
    var name: String
    var age: Int
    
    mutating func increaseAge() {
        self.age += 1
    }
    
    mutating func decreaseAge() {
        self.age -= 1
    }
}
