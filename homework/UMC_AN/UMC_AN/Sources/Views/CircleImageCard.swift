//
//  CircleImageCard.swift
//  UMC_AN
//
//  Created by 안승현 on 4/7/25.
//

import SwiftUI

struct CircleImageCard: View {
    var menu: Menu
    
    var body: some View {
        VStack {
            Image(menu.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .clipShape(Circle())
            Spacer()
            Text(menu.name)
                .font(.mainTextSemiBold14)
                .foregroundColor(Color("black01"))
        }
        .frame(width: 130, height: 160)
    }
}

#Preview {
    CircleImageCard(menu: Menu(name: "에스프레소 콘파나", imageName: "espresso_conpana"))
}
