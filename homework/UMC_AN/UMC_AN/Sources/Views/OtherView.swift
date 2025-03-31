//
//  OtherView.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/30.
//

import SwiftUI

struct OtherView: View {
    @AppStorage("userNickname") private var userNickname: String = "(작성한 닉네임)"
    
    var body: some View {
        VStack(alignment: .center, spacing: 41){
            topBackground
            VStack(alignment: .center) {
              nickName
              Spacer()
              // Alternating Views and Spacers
              reUseButton
                Spacer()
            }
            .frame(alignment: .center)
            
            pay
            surport
        }
        .frame(alignment: .top)
        .background(Color("gray07"))
        .padding(.bottom, 1)
    }
    private var topBackground : some View{
            HStack(alignment: .center, spacing: 0) {
                Text("Other")
                    .font(.mainTextBold24)
                    .foregroundColor(Color("black01"))
                Spacer()
                Button(action: {
                    print("로그아웃")
                }) {
                    Image("logout")
                        .frame(width: 35, height: 35)
                        .overlay(
                            Rectangle()
                                .stroke(.black, lineWidth: 1.5)
                        )
                }
            }
            .padding(.horizontal, 23.5)
            .padding(.vertical, 16)
            .background(.white)
            .frame(alignment: .bottom)
    }
    
    private var nickName : some View{
        VStack(alignment: .center, spacing: 5) {
            // mainText/mainTextSemibold24
            Text("\(userNickname) 님")
                .font(.mainTextSemiBold24)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("green00"))
            HStack(alignment: .center, spacing: 4) {
                // mainText/mainTextSemibold24
                Text("환영합니다!")
                    .font(.mainTextSemiBold24)
                  .multilineTextAlignment(.trailing)
                  .foregroundColor(Color("black01"))
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 24, height: 21)
                  .background(
                    Image("icon9")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 24, height: 21)
                      .clipped()
                  )
            }
            .padding(0)
        }
        .padding(0)
    }
    
    private var reUseButton: some View{
        HStack(alignment: .top, spacing: 10.5) {
            ReuseButton(iconName: "icon6", buttonText: "별 히스토리") {
                print("별 히스토리")
            }
            
            ReuseButton(iconName: "icon7", buttonText: "전자 영수증") {
                print("전자 영수증")
            }
            
            ReuseButton(iconName: "icon8", buttonText: "나만의 메뉴") {
                print("나만의 메뉴")
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 0)
    }
    
    private var pay : some View{
        VStack(alignment: .leading, spacing: 8) {
            Text("Pay")
                .font(.mainTextSemiBold18)
              .foregroundColor(.black)
            HStack(alignment: .top) {
                // Space Between
                ReuseButton1(iconName: "other1", buttonText: "스타벅스 카드 등록") {
                    print("스타벅스 카드 등록")
                }
                Spacer()
                // Alternative Views and Spacers
                ReuseButton1(iconName: "other9", buttonText: "카드 교환권 등록") {
                    print("카드 교환권 등록")
                }
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 16)
            .frame(alignment: .top)
            HStack(alignment: .top) {
                // Space Between
                ReuseButton1(iconName: "other2", buttonText: "쿠폰 등록") {
                    print("쿠폰 등록")
                }
                Spacer()
                // Alternative Views and Spacers
                ReuseButton1(iconName: "other8", buttonText: "쿠폰 히스토리") {
                    print("쿠폰 히스토리")
                }
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 16)
            .frame(alignment: .top)
            
            Divider()
        }
        .padding(10)
        .frame(alignment: .leading)
    }
    
    private var surport : some View{
        VStack(alignment: .leading, spacing: 8) {
            Text("고객지원")
                .font(.mainTextSemiBold18)
              .foregroundColor(.black)
            HStack(alignment: .top) {
                // Space Between
                ReuseButton1(iconName: "other3", buttonText: "스토어 케어") {
                    print("스토어 케어")
                }
                Spacer()
                // Alternative Views and Spacers
                ReuseButton1(iconName: "other7", buttonText: "고객의 소리") {
                    print("고객의 소리")
                }
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 16)
            .frame(alignment: .top)
            
            HStack(alignment: .top) {
                // Space Between
                ReuseButton1(iconName: "other4", buttonText: "매장 정보") {
                    print("매장 정보")
                }
                Spacer()
                // Alternative Views and Spacers
                ReuseButton1(iconName: "other6", buttonText: "반납기 정보") {
                    print("반납기 정보")
                }
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 16)
            .frame(alignment: .top)
            HStack(alignment: .top) {
                // Space Between
                ReuseButton1(iconName: "other5", buttonText: "마이 스타벅스 리뷰") {
                    print("마이 스타벅스 리뷰")
                }
                Spacer()
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 16)
            .frame(alignment: .top)
        }
        .padding(10)
        .frame(alignment: .leading)
    }
    
}

#Preview {
    OtherView()
}
