//
//  ReuseButton1.swift
//  UMC_AN
//
//  Created by 안승현 on 3/31/25.
//

import SwiftUI

struct ReuseButton1: View {
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
            HStack(alignment: .center, spacing: 4) {
                Image(iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                text
                Spacer()
            }
            .padding(0)
            .frame(width: 157, alignment: .leading)
        }
    }
    
    private var text: some View {
        Text(buttonText)
          .font(.mainTextSemiBold16)
          .foregroundColor(Color("black01"))
    }
}

#Preview {
    ReuseButton1(iconName: "other1", buttonText: "별리") {
        print("별 히스토리")
    }
}
