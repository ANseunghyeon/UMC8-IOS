//
//  WhatsNewView.swift
//  UMC_AN
//
//  Created by 안승현 on 4/7/25.
//

import SwiftUI

struct WhatsNewCard: View {
    var whatsNew: WhatsNew
    var body: some View {
        VStack(alignment: .leading){
            Image(whatsNew.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 242, height: 160)
                .clipped()
            Spacer()
            Text(whatsNew.title)
                .font(.mainTextSemiBold18)
            Spacer()
            Text(whatsNew.description)
                .font(.mainTextSemiBold13)
        }
        .padding(0)
        .frame(width: 240, height: 249)
    }
}

#Preview {
    WhatsNewCard(whatsNew: WhatsNew(
        title: "2023년",
        description: "adfadf",
        imageName: "new1"
    ))
}
