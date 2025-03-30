//
//  ReuseButton.swift
//  UMC_AN
//
//  Created by 안승현 on 3/31/25.
//

import SwiftUI

struct ReuseButton: View {
    let iconName: String
    let buttonText: String
    let action: () -> Void
    
    init(iconName: String, buttonText: String, action: @escaping () -> Void = {}) {
        self.iconName = iconName
        self.buttonText = buttonText
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(alignment: .center, spacing: 4) {
                Image(iconName)
                    .resizable()
                    .frame(width: 30, height: 30)
                Spacer()
                text
                Spacer()
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 19)
            .frame(width: 102, height: 108, alignment: .center)
            .background(.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.1), radius: 2.5, x: 0, y: 0)
        }
    }
    
    private var text: some View {
        Text(buttonText)
          .font(.mainTextSemiBold16)
          .multilineTextAlignment(.center)
          .foregroundColor(Color("black01"))
          .frame(width: 102, alignment: .center)
    }
}

#Preview {
    HStack {
        ReuseButton(iconName: "icon6", buttonText: "별 히스토리") {
            print("별 히스토리")
        }
        ReuseButton(iconName: "icon7", buttonText: "전자 영수증"){
            print("전자 영수증")
        }
        ReuseButton(iconName: "icon8", buttonText: "나만의 메뉴")
        {
            print("나만의 메뉴")
        }
    }
}
