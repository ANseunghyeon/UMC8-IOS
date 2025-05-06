//
//  ReceiptModel.swift
//  UMC_AN
//
//  Created by 안승현 on 5/6/25.
//

import Foundation
import SwiftData

@Model
class Receipt {
    @Attribute(.unique) var id: UUID
    var storeName: String
    var date: Date
    var totalAmount: Double
    var imageData: Data?
    
    init(storeName: String, date: Date, totalAmount: Double, imageData: Data? = nil) {
        self.id = UUID()
        self.storeName = storeName
        self.date = date
        self.totalAmount = totalAmount
        self.imageData = imageData
    }
}
