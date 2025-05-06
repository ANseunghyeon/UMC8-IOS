//
//  TabBar.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/30.
//

import SwiftUI

struct PayView: View {
    var body: some View {
        Text("결제 화면")
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
            Tab("Home", image: "icon1") {
                HomeView()
            }
            
            Tab("Pay", image: "icon2") {
                PayView()
            }
            
            Tab("Order", image: "icon3") {
                OrderView()
            }
            
            Tab("Shop", image: "icon4") {
                ShopView()
            }
            
            Tab("Other", image: "icon5") {
                ReceiptView()
                //OtherView()
            }
        }
        .tint(Color("green02"))
    }
}

#Preview {
    TabBar()
}
