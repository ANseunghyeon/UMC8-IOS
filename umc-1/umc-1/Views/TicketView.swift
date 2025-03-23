//
//  TicketView.swift
//  umc-1
//
//  Created by 안승현 on 2025/03/23.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        ZStack {
            Image(.background)
            VStack {
                            
                Spacer().frame(height: 111)
                
                mainTitleGroup
                
                Spacer().frame(height: 134)
                
                mainBottomGroup
            }
        }
        .padding()
    }
    
    private var mainTitleGroup: some View {
        VStack {
            Group {
                Text("마이펫의 이중생활2")
                    .font(.PretendardBold30)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                Text("본인 + 동반 1인")
                    .font(.PretendardLight16)
                Text("30,100원")
                    .font(.PretendardBold24)
            }
            .foregroundStyle(Color.white)
        }
        .frame(height: 84)
    }
    
    private var mainBottomGroup: some View {
        Button(action: {
            print("Hello")
        }, label: {
            VStack {
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 18, height: 12)
                Text("예매하기")
                    .font(.PretendardSemiBold18)
                    .foregroundStyle(Color.white)
            }
            .frame(width: 63, height: 40)
        })
    }
}

#Preview {
    TicketView()
}

#Preview {
    TicketView()
}
