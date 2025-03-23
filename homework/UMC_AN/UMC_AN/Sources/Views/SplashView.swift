//
//  SplashView.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color("green00").ignoresSafeArea()
            
            Image(.logo)
                .resizable()
                .frame(width: 168, height: 168)
        }
    }
}

#Preview {
    SplashView()
}

