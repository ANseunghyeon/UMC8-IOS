//
//  CoffieDetailView.swift
//  UMC_AN
//
//  Created by 안승현 on 4/7/25.
//

import SwiftUI

struct CoffieDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State var detail: CoffieDetail
    @State private var selectedTemper: Temper = .hot
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            ZStack(alignment: .top) {
                Image(detail.imagename)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(maxWidth: .infinity, minHeight: 355, maxHeight: 355)
                    .ignoresSafeArea()
                
                topController.padding()
            }
            
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        // mainText/mainTextSemibold24
                        Text(detail.name)
                            .font(.mainTextSemiBold24)
                        Text("New")
                            .font(.mainTextSemiBold13)
                            .foregroundColor(Color("green00"))
                    }
                    
                    // mainText/mainTextSemiBold14
                    Text(detail.en_name)
                        .font(.mainTextSemiBold14)
                        .foregroundColor(Color("gray01"))
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(detail.description)
                        .font(.mainTextLight14)
                    Group{
                        Text(detail.price)
                            .font(.mainTextBold24)
                        +
                        Text(" 원")
                            .font(.mainTextBold24)
                    }
                }
                Spacer()
                TemperatureController
            }
            .padding(.horizontal, 30)
            .frame(maxHeight: 256)
            
            Spacer()
            Divider()
            OderButton
        }.frame(maxWidth: .infinity)
    }
    
    private var topController: some View{
        HStack(alignment: .center) {
            Button(action: {
                dismiss()
            }) {
                Image("back")
            }.padding()
            Spacer()
            Button(action:{
                
            }){
                Image("share")
            }.padding()
        }
    }
    
    private var TemperatureController: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 999)
                .fill(Color("gray00"))
                .frame(maxWidth: .infinity, maxHeight: 36)
            
            if detail.temper.isChangeable {
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 999)
                        .fill(Color("white01"))
                        .frame(width: geometry.size.width / 2)
                        .shadow(color: Color("black01").opacity(0.1), radius: 4, x: 0, y: 2)
                        .offset(x: selectedTemper == .hot ? 0 : geometry.size.width / 2)
                }
            } else {
                RoundedRectangle(cornerRadius: 999)
                    .fill(Color("white01"))
                    .frame(maxWidth: .infinity, maxHeight: 36)
                    .shadow(color: Color("black01").opacity(0.1), radius: 4, x: 0, y: 2)
            }
            
            HStack(alignment: .center, spacing: 0) {
                if detail.temper.isChangeable {
                    ForEach(Temper.selectableOptions, id: \.self) { temp in
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                selectedTemper = temp
                            }
                        }) {
                            Text(temp.rawValue)
                                .foregroundColor(selectedTemper == temp ? temp.textColor : .gray)
                                .frame(maxWidth: .infinity)
                        }
                    }
                } else {
                    Text(detail.temper.rawValue)
                        .foregroundColor(detail.temper == .hotonly ? .red : .blue)
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 36)
        }
        .frame(maxWidth: .infinity, maxHeight: 36)
        .onAppear {
            selectedTemper = detail.temper == .hotonly ? .hot : 
                            detail.temper == .iceonly ? .ice : 
                            detail.temper
        }
    }
    
    private var OderButton: some View{
        Button(action: {
            print("주문하기")
        }){
            HStack(alignment: .center, spacing: 0) {
                Text("주문하기")
                    .font(.mainTextMedium16)
                    .foregroundColor(Color("white01"))
            }
            .frame(maxWidth: .infinity, maxHeight: 43)
            .background(Color("green00"))
            .cornerRadius(999)
        }.padding(.horizontal, 50)
    }
}

#Preview {
    CoffieDetailView(detail: CoffieDetail(name:"아이스 카라멜 마끼아또", en_name: "Caramel Macchiato", imagename: "caramerlCold", description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료", price: "6100", temper: .iceonly))
}
