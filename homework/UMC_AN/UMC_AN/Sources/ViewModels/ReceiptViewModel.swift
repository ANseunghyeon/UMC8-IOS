//
//  ReceiptViewModel.swift
//  UMC_AN
//
//  Created by 안승현 on 5/6/25.
//

import Foundation
import SwiftUI
import SwiftData
import Vision

class ReceiptViewModel: ObservableObject {
    @Published var receipts: [Receipt] = []
    @Published var selectedReceiptImage: UIImage? = nil
    @Published var isImageViewPresented = false
    
    func getTotalCount() -> Int {
        return receipts.count
    }
    
    func getTotalAmount() -> Double {
        return receipts.reduce(0) { $0 + $1.totalAmount }
    }
    
    func extractReceiptInfo(from image: UIImage, completion: @escaping (String, Date, Double) -> Void) {
        // 실제 앱에서는 Vision 프레임워크를 이용해 텍스트 인식을 구현할 수 있습니다
        // 여기서는 간단한 예시 값을 반환합니다
        let storeName = "스타벅스 신논현점"
        let date = Date()
        let totalAmount = 5600.0
        
        completion(storeName, date, totalAmount)
    }
    
    func showReceiptImage(for receipt: Receipt) {
        if let imageData = receipt.imageData, let image = UIImage(data: imageData) {
            selectedReceiptImage = image
            isImageViewPresented = true
        }
    }
}
