//
//  LoginView.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/23.
//

import SwiftUI

struct LoginView: View {

    
    var body: some View {
        //상단 패딩
        VStack(alignment: .center, spacing: 104) {}
        .padding(0)
        .frame(width: 402, height: 104, alignment: .top)
        .background(.white)
        
        //전체 프레임
        VStack(alignment: .leading) {
            mainHead
            Spacer()
            idFiled
            Spacer()
            ssoLogin
            Spacer()
        }
        .padding(.horizontal, 19)
        .frame(height: 751)
        
    }
    
    private var mainHead: some View{
        VStack(alignment: .leading){
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: 97, height: 95)
            .background(
                Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            )
            
            Spacer()
            
            Text("안녕하세요.\n스타벅스입니다.")
                .font(.mainTextExtraBold24)
                .kerning(1.2)
                .foregroundColor(Color("black01"))
            
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .font(.mainTextMedium16)
                .foregroundColor(Color("gray01"))
        }
        .frame(height: 219)
    }
    
    private var idFiled: some View{
        VStack(alignment: .leading){
            Group{
                Text("아이디")
                    .font(.mainTextRegular13)
                    .foregroundColor(Color("black01"))
                
                Divider()
            }.frame(height: 20)
            
            Spacer()
            
            Group{
                Text("비밀번호")
                    .font(.mainTextRegular13)
                    .foregroundColor(Color("black01"))
                
                Divider()
            }.frame(height: 20)
            
            Spacer()
            
            Button(action: {
                print("hello")
            }) {
                ZStack {
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 46)
                    .background(Color("green01"))
                    .cornerRadius(20)
                    
                    Text("로그인하기")
                        .font(.mainTextMedium16)
                        .foregroundColor(Color("white01"))
                        .frame(width: 71, alignment: .topLeading)
                }
            }
            .frame(height: 46)
        }
        .frame(height: 180)
    }
    
    private var ssoLogin : some View{
        VStack{
            Button(action: {
                print("hello")
            }) {
                Text("이메일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .underline(true, pattern: .solid)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("gray04"))
            }
            
            Spacer()

            Button(action: {
                print("hello")
            }) {
                HStack(alignment: .top, spacing: 0) {
                    Image("kakao_login")
                }
                .padding(0)
                .frame(alignment: .topLeading)
            }
            
            Spacer()
            
            Button(action: {
                print("hello")
            }) {
                HStack(alignment: .top, spacing: 0) {
                    Image("apple_login")
                }
                .padding(0)
                .frame(alignment: .topLeading)
            }
            
        }
        .frame(height: 144, alignment: .center)
    }
}

#Preview {
    LoginView()
}
