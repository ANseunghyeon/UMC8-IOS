//
//  TabBar.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("홈 화면")
    }
}

struct PayView: View {
    var body: some View {
        Text("결제 화면")
    }
}

struct ShopView: View {
    var body: some View {
        Text("쇼핑 화면")
    }
}

struct OrderView: View {
    var body: some View {
        Text("오더 화면")
    }
}

struct TabBar: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            
            Tab("Pay", systemImage: "creditcard") {
                PayView()
            }
            
            Tab("Order", systemImage: "list.bullet") {
                OrderView()
            }
            
            Tab("Shop", systemImage: "cart") {
                ShopView()
            }
            
            Tab("Other", systemImage: "ellipsis") {
                OtherView()
            }
        }
        .accentColor(Color("green01"))
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = UIColor(named: "gray00")
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    }
}

#Preview {
    TabBar()
}
