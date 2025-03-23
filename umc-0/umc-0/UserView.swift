//
//  UserView.swift
//  umc-0
//
//  Created by 안승현 on 2025/03/17.
//
/*
import SwiftUI

struct UserView: View {
    
    @StateObject var viewModel: UserViewModel
    
    init() {
        self._viewModel = .init(wrappedValue: .init(userModel: .init(name: "알바/안승현", age: 29)))
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    viewModel.increaseAge()
                }, label: {
                    Image(systemName: "arrow.up.square") // SFSymbol입니다. 0주차를 확인해주세요!
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.black)
                })
                
                Button(action: {
                    viewModel.decreaseAge()
                }, label: {
                    Image(systemName: "arrow.down.square")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.black)
                })
            }
            
            Group {
                Text("이름: \(viewModel.userModel.name)")
                Text("나이: \(viewModel.userModel.age)")
            }
            .padding(.top, 20)
        }
    }
}
*/
//import SwiftUI
//struct SwiftUIView: View {
//    var body: some View {
//        Text("Hello, World!")
//            .font(.largeTitle) /* 글꼴 크기 제목으로 설정 */
//            .foregroundStyle(Color.red) /* 빨간색으로 변경 */
//            .underline() /* 밑줄 */
//            .strikethrough(true, color: Color.black) /* 가운데선(취소선) 검정색으로 */
//            .lineLimit(nil) /* linelimit이 있으면 ...으로 표시되는데, 이 제한을 풀음. */
//            .kerning(1.5) /* 자간 설정 */
//            .lineSpacing(2.5) /* 행간 설정 */
//            .padding() /* 뷰에 패딩 설정. 디폴트 패딩은 스위프트가 알아서 결정함. */
//            .overlay(content: {
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.clear)
//                    .stroke(Color.black, style: .init(lineWidth: 1))
//            }) /* 이 글귀를 지우시고 해당 수정자의 역할을 주석으로 달아주세요 */
//            .dynamicTypeSize(.large) /* 이 글귀를 지우시고 해당 수정자의 역할을 주석으로 달아주세요 */
//    }
//}
//
//#Preview {
//    SwiftUIView()
//}
//import SwiftUI
//
//struct SwiftUIView: View {
//    var body: some View {
//        Image(systemName: "eraser.fill")
//            .resizable()
//            .frame(width: 300, height: 30)
//            .aspectRatio(contentMode: .fill) /* 이 부분 fit 과 fill 그리고 수정자 자체를 사용하지 않을 때 3가지 차이가 있습니다. 스스로 학습하시기 바라겠습니다. */
//            .background() {
//                Rectangle()
//                    .fill(Color.green)
//                    .frame(width: 400, height: 300)
//                    .border(Color.black)
//            }
////            .border(Color.red)
////            .clipShape(RoundedRectangle(cornerRadius: 100))
////            .foregroundStyle(Color.red)
//    }
//}
//
//#Preview {
//    SwiftUIView()
//}

import SwiftUI

struct AspectRatioExample: View {
    var body: some View {
        VStack {
            Text("aspectRatio(contentMode: .fit)")
            Image(systemName: "photo")
                .resizable()
                .frame(width: 100, height: 200)
                .aspectRatio(contentMode: .fit) // 이미지가 프레임 내에 완전히 표시되도록 크기를 조정합니다.
                .border(Color.black)

            Text("aspectRatio(contentMode: .fill)")
            Image(systemName: "photo")
                .resizable()
                .frame(width: 100, height: 200)
                .aspectRatio(contentMode: .fill) // 이미지가 프레임을 완전히 채우도록 크기를 조정합니다.
                .border(Color.black)

            Text("aspectRatio 수정자 미사용")
            Image(systemName: "photo")
                .resizable()
                .frame(width: 100, height: 200) // aspectRatio 수정자를 사용하지 않습니다.
                .border(Color.black)
        }
    }
}

#Preview {
    AspectRatioExample()
}
