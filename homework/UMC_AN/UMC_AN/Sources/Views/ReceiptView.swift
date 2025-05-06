//
//  ReceiptView.swift
//  UMC_AN
//
//  Created by 안승현 on 5/6/25.
//

import SwiftUI
import SwiftData

struct ReceiptView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var receipts: [Receipt] = []
    
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var viewModel = ImageViewModel()
    @State private var showingAnalysisFailure = false
    
    var body: some View {
        VStack(spacing: 0) {
            // 상단 네비게이션 바
            ReceiptHeaderView(
                onBackTapped: { dismiss() },
                onAddTapped: { showingActionSheet = true }
            )
            
            // 총 영수증 개수 및 합계
            HStack {
                Text("총 \(receipts.count)건")
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                Text("사용합계 \(formatCurrency(viewModel.getTotalAmount()))원")
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(Color("gray07"))
            
            // OCR 처리 중일 때 로딩 표시
            if viewModel.isProcessing {
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                    
                    Text("영수증 분석 중...")
                        .font(.system(size: 16))
                        .padding(.top, 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
            } else {
                // 영수증 목록
                if receipts.isEmpty {
                    VStack(spacing: 15) {
                        Image(systemName: "doc.text")
                            .font(.system(size: 50))
                            .foregroundColor(Color.gray)
                        
                        Text("영수증이 없습니다")
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("+ 버튼을 눌러 영수증을 추가해 보세요")
                            .font(.system(size: 14))
                            .foregroundColor(Color.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(receipts) { receipt in
                                Button(action: {
                                    viewModel.showReceiptImage(for: receipt)
                                }) {
                                    ReceiptRowView(receipt: receipt)
                                        .contentShape(Rectangle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                Divider()
                            }
                        }
                        .background(Color.white)
                    }
                }
            }
        }
        .onAppear {
            print("모델 컨텍스트 확인: \(modelContext)")
            fetchReceipts()
            viewModel.receipts = receipts
        }
        .onChange(of: receipts) { oldValue, newValue in
            // Make sure the viewModel's receipts array is updated when receipts change
            viewModel.receipts = newValue
            print("영수증 목록 업데이트: \(newValue.count)건")
        }
        .confirmationDialog("영수증을 어떻게 가져올까요?", isPresented: $showingActionSheet) {
            Button("카메라") {
                sourceType = .camera
                showingImagePicker = true
            }
            Button("앨범") {
                sourceType = .photoLibrary
                showingImagePicker = true
            }
            Button("취소", role: .cancel) {}
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(selectedImage: $selectedImage, sourceType: sourceType)
                .onDisappear {
                    if let image = selectedImage {
                        // 직접 영수증 추가 메서드 호출
                        addReceipt(with: image)
                        selectedImage = nil
                    }
                }
        }
        .sheet(isPresented: $viewModel.isImageViewPresented) {
            ReceiptImageView(image: viewModel.selectedReceiptImage, isPresented: $viewModel.isImageViewPresented)
        }
        .alert("분석에 실패했습니다", isPresented: $showingAnalysisFailure) {
            Button("확인") { showingAnalysisFailure = false }
        } message: {
            Text("영수증이 기본 정보로 추가되었습니다.")
        }
        .background(Color("gray07"))
    }
    
    private func fetchReceipts() {
        // 이미 메모리에 있는 영수증을 사용
        if !receipts.isEmpty {
            print("메모리에서 가져온 영수증: \(receipts.count)건")
            viewModel.receipts = receipts
            return
        }
        
        // SwiftData 쿼리 시도
        do {
            let descriptor = FetchDescriptor<Receipt>(sortBy: [SortDescriptor(\.date, order: .reverse)])
            let fetchedReceipts = try modelContext.fetch(descriptor)
            print("SwiftData에서 영수증 가져오기 시도: \(fetchedReceipts.count)건")
            
            // 결과가 있으면 사용
            if !fetchedReceipts.isEmpty {
                receipts = fetchedReceipts
                viewModel.receipts = receipts
            }
        } catch {
            print("SwiftData 쿼리 오류: \(error)")
        }
    }
    
    private func addReceipt(with image: UIImage) {
        viewModel.directAddReceipt(image: image) { receipt in
            // SwiftData에 저장 시도
            modelContext.insert(receipt)
            
            do {
                try modelContext.save()
                print("영수증 저장 성공")
                
                // 메모리에 직접 업데이트 (SwiftData 쿼리가 작동하지 않는 경우를 대비)
                self.receipts.insert(receipt, at: 0)
                self.viewModel.receipts = self.receipts
                
                print("메모리에 영수증 추가됨: 현재 \(self.receipts.count)건")
            } catch {
                print("영수증 저장 실패: \(error)")
                // 분석 실패 알림 표시
                showingAnalysisFailure = true
            }
        }
    }
    
    private func formatCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: value)) ?? "0"
    }
}

// 상단 헤더 뷰
struct ReceiptHeaderView: View {
    var onBackTapped: () -> Void
    var onAddTapped: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onBackTapped) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color("black01"))
            }
            Spacer()
            Text("전자 영수증")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color("black01"))
            Spacer()
            Button(action: onAddTapped) {
                Image(systemName: "plus")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("black01"))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(Color.white)
    }
}

// 영수증 행 뷰
struct ReceiptRowView: View {
    var receipt: Receipt
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(receipt.storeName)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color("black01"))
            
            Text(formatDate(receipt.date))
                .font(.system(size: 14))
                .foregroundColor(Color.gray)
            
            Text("\(formatCurrency(receipt.totalAmount))원")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color("black01"))
                .padding(.top, 3)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            HStack {
                Spacer()
                Image(systemName: "dollarsign.circle")
                    .font(.system(size: 20))
                    .foregroundColor(Color("green00"))
                    .padding(.trailing, 20)
            }
        )
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        return formatter.string(from: date)
    }
    
    private func formatCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: value)) ?? "0"
    }
}

// 영수증 이미지 전체화면 뷰
struct ReceiptImageView: View {
    var image: UIImage?
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8).ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                
                Spacer()
                
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    Text("이미지를 불러올 수 없습니다")
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ReceiptView()
        .modelContainer(for: Receipt.self, inMemory: true)
}
