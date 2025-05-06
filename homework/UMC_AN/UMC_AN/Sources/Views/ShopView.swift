//
//  ShopView.swift
//  UMC_AN
//
//  Created by 안승현 on 5/01/25.
//

import SwiftUI

struct ShopView: View {
    // 페이지 컨트롤 상태 변수
    @State private var currentPage = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                topBanner
                allProducts
                bestItems
                newProducts
            }
            .padding(.bottom, 20)
        }
    }
    
    // 상단 배너
    private var topBanner: some View {
        VStack(alignment: .leading) {
            Text("Starbucks Online Store")
                .font(.mainTextBold24)
                .padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    bannerImage(imageName: "topbanner1")
                    bannerImage(imageName: "topbanner2")
                    bannerImage(imageName: "topbanner3")
                }
            }
            .frame(height: 200)
        }
    }
    
    // 배너 이미지 컴포넌트
    private func bannerImage(imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 270, height: 216)
            .clipped()
    }
    
    // All Products
    private var allProducts: some View {
        VStack(alignment: .leading) {
            Text("All Products")
                .font(.mainTextBold24)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    productCategory(image: "allp1", title: "텀블러")
                    productCategory(image: "allp2", title: "커피용품")
                    productCategory(image: "allp3", title: "선물세트")
                    productCategory(image: "allp4", title: "보온병")
                    productCategory(image: "allp5", title: "머그컵")
                }
                .padding(.horizontal)
            }
            .frame(height: 140)
        }
    }
    
    // 카테고리 컴포넌트 추가
    private func productCategory(image: String, title: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 80, height: 80)
                .background(
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipped()
                )
                .cornerRadius(80)
            
            Text(title)
                .font(.mainTextSemiBold13)
                .foregroundColor(.black)
        }
        .padding(0)
    }
    
    // Best Items
    private var bestItems: some View {
        VStack(alignment: .leading) {
            Text("Best Items")
                .font(.mainTextBold24)
                .padding(.horizontal)
            
            TabView(selection: $currentPage) {
                // 첫 번째 페이지
                VStack {
                    HStack(spacing: 20) {
                        shopImage(menuImage: "best1", title: "그린 사이렌 슬리브 머그", text: "355ml", action: {})
                        shopImage(menuImage: "best2", title: "그린 사이렌 클래식 머그", text: "355ml", action: {})
                    }
                    .padding(.horizontal)
                }
                .tag(0)
                
                // 두 번째 페이지
                VStack {
                    HStack(spacing: 20) {
                        shopImage(menuImage: "best3", title: "사이렌 머그 앤 우드 소서", text: " ", action: {})
                        shopImage(menuImage: "best4", title: "리저브 골드 테일 머그", text: "355ml", action: {})
                    }
                    .padding(.horizontal)
                }
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 250)
        }
    }
    
    // New Products
    private var newProducts: some View {
        VStack(alignment: .leading) {
            Text("New Products")
                .font(.mainTextBold24)
                .padding(.horizontal)
            
            let columns = [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
            
            LazyVGrid(columns: columns, spacing: 20) {
                shopImage(menuImage: "newp1", title: "그린 사이렌 도트 머그", text: "237ml", action: {})
                shopImage(menuImage: "newp2", title: "그린 사이렌 클래식 머그", text: "355ml", action: {})
                shopImage(menuImage: "newp3", title: "홈 카페 미니 머그 세트", text: " ", action: {})
                shopImage(menuImage: "newp4", title: "홈 카페 글라스 세트", text: " ", action: {})
            }
            .padding(.horizontal)
        }
    }
}

struct shopImage: View {
    var menuImage: String
    var title: String
    var text: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(menuImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .foregroundColor(.black)
                Text(title)
                    .font(.mainTextLight14)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text(text)
                    .font(.mainTextLight14)
                    .foregroundColor(.black)
                    .lineLimit(1)
            }
            .frame(width: 150, height: 200)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

#Preview {
    ShopView()
}
