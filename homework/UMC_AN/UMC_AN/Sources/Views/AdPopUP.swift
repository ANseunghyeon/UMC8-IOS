//
//  AdPopUP.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/30.
//

import SwiftUI

struct AdPopUP: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .center) {
            // Space Between
            popUpImage
            Spacer()
            // Alternating Views and Spacers
            updateButton
        }
        .padding(.bottom, 36)
        .frame(width: 438, alignment: .center)
    }
    
    private var popUpImage : some View{
        Rectangle()
            .foregroundColor(.clear)
            .frame(minHeight: 720, maxHeight: 720)
            .background(
                Image("adimage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .infinity, height: .infinity)
                    .clipped()
            )
    }
    private var updateButton : some View {
        VStack {
            Button(action: {
                print("자세히보기")
            }) {
                HStack(alignment: .center, spacing: 10) {
                    Text("자세히보기")
                        .font(.mainTextMedium16)
                        .foregroundColor(.white)
                }
                .frame(width:320, height: 58)
                .background(Color("green01"))
                .cornerRadius(20)
            }
            Spacer()
            Button(action: {
                dismiss()
            }){
                HStack{
                    Spacer()
                    Text("X 닫기")
                        .font(.mainTextLight14)
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color("gray01"))
                }
            }
        }.frame(width: 320, height: 74)
    }
    
}

#Preview {
    AdPopUP()
}
