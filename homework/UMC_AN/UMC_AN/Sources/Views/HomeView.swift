//
//  HomeView.swift
//  UMC_AN
//
//  Created by 안승현 on 4/7/25.
//

import SwiftUI

struct HomeView: View {
    @State private var star: Float = 1 / 12.0
    @StateObject var menuViewModel = MenuViewModel()
    @StateObject var whatsNewViewModel = WhatsNewViewModel()
    @StateObject var breadViewModel = BreadViewModel()
    
    var body: some View {
            ScrollView(.vertical){
                VStack() {
                    Banner
                    Entire
                }
            }
            .ignoresSafeArea(.all)
    }
    private var Entire: some View{
        VStack{
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 420, height: 183)
              .background(
                Image(.banner)
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 420, height: 183)
                  .clipped()
              )
              .cornerRadius(4)
              .shadow(color: .black.opacity(0.06), radius: 2, x: 0, y: 6)
              .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)
            VStack (alignment: .leading){
                Group{
                    Text("\(menuViewModel.displayName)")
                        .font(.mainTextBold20)
                        .foregroundStyle(.brown01)
                    +
                    Text("님을 위한 추천 메뉴")
                        .font(.mainTextBold20)
                }
                .padding()

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(menuViewModel.menuItems) { menuItem in
                            if let coffeeDetail = CoffieDetailViewModel().CoffieDetails[menuItem.name] {
                                NavigationLink(destination: CoffieDetailView(detail: coffeeDetail)) {
                                    CircleImageCard(menu: menuItem)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
            
            VStack{
                Image(.eventBanner)
                Image(.serviceSuscibe)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                // mainText/mainTextBold24
                Text("What's New")
                    .font(.mainTextBold20)
                    .foregroundColor(Color("black01"))
                    .padding(.horizontal, 30)
                ScrollView(.horizontal){
                    LazyHStack(spacing: 20) {
                        ForEach(whatsNewViewModel.WhatsNews) { WhatsNews in
                            WhatsNewCard(whatsNew: WhatsNews)
                        }
                    }
                    .padding()
                }
                
                 
            }
            
            VStack{
                Image(.banner2)
                ZStack(alignment: .leading){
                    Image(.banner3)
                    VStack(alignment: .leading, spacing: 16){
                        VStack(alignment: .leading, spacing: 4){
                            Text("TIP")
                                .font(.mainTextSemiBold13)
                                .foregroundColor(Color("gray01"))
                            Text("온라인 스토어\n별★ 적립 혜택")
                                .font(.mainTextBold20)
                        }
                        
                        Text("온라인 스토어 구매 시\n별★을 적립해 드립니다.")
                            .font(.mainTextSemiBold16)
                            .foregroundColor(Color("gray01"))
                    }.padding()
                }
                ZStack(alignment: .leading){
                    Image(.banner4)
                    VStack(alignment: .leading, spacing: 16) {
                        Text("딜리버스\n예약 배달 서비스")
                            .font(.mainTextBold24)
                            .foregroundColor(Color("green00"))
                        Text("특별한 순간을 위해\n미리 예약해 보세요.")
                            .font(.mainTextBold20)
                    }.padding(.horizontal, 30)
                }
                
            }
            VStack (alignment: .leading){
        
                Text("하루가 달콤해지는 디저트")
                    .font(.mainTextBold20)
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(breadViewModel.menuItems) { menuItem in
                                CircleImageCard(menu: menuItem)
                            }
                        }
                    }
                    .padding(.horizontal)
            }
            .padding(.horizontal)
            
            VStack{
                Image(.banner5)
                Image(.banner6)
                Image(.banner7)
            }.padding()
        }
    }
    private var Banner: some View{
        ZStack(){
            Image(.topImg)
            VStack(alignment: .leading, spacing: 10){
                // mainText/mainTextBold24
                Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                    .font(.mainTextMedium16)
                    .foregroundColor(Color("black01"))
                    .padding(.horizontal, 30)
                    .padding(.top, 100)
            
                HStack {
                    VStack(alignment: .leading){
                        Text("11 ★ until next Reward")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(Color("brown01"))
                        
                        ProgressView(value: star, total: 1)
                            .tint(Color("brown01"))
                            .frame(height: 10)
                    }
                    
                    Spacer()
                    
                    HStack{
                        Text("1 /")
                            .font(.mainTextBold20)
                        Text("12★")
                            .font(.mainTextBold20)
                            .foregroundStyle(Color("brown01"))
                    }
                }
                .padding(.horizontal, 30)
                
                
            }
        }.frame(width: 440, height: 259)
    }
    
}




#Preview {
    HomeView()
}
