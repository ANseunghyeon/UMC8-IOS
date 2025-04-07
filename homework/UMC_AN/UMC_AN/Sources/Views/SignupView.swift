//
//  SignupView.swift
//  UMC_AN
//
//  Created by 안승현 on 2025/03/30.
//

import SwiftUI

struct SignupView: View {
    @StateObject private var viewModel = SignupViewModel()
    @FocusState private var nicknameFocused: Bool
    @FocusState private var emailFocused: Bool
    @FocusState private var passwordFocused: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack() {}.frame(height: 210)
        
        VStack(alignment: .leading){
            inputFields
            Spacer()
            updateButton
        }
        .padding(19)
        .frame(height: 674)
        
        VStack(){}.frame(height: 72)
    }
    
    private var inputFields: some View{
        VStack(alignment: .leading){
            Group{
                VStack(spacing: 3) {
                    TextField("닉네임", text: $viewModel.signup.nickname)
                        .font(.mainTextRegular18)
                        .focused($nicknameFocused)
                    
                    Divider()
                        .background(nicknameFocused ? Color("green01") : Color("black01"))
                }
            }.frame(height: 30)
            
            Spacer()
            
            Group{
                VStack(spacing: 3) {
                    TextField("이메일", text: $viewModel.signup.email)
                        .font(.mainTextRegular18)
                        .focused($emailFocused)
                    
                    Divider()
                        .background(emailFocused ? Color("green01") : Color("black01"))
                }
            }.frame(height: 30)
            
            Spacer()
            
            Group{
                VStack(spacing: 3) {
                    SecureField("비밀번호", text: $viewModel.signup.password)
                        .font(.mainTextRegular18)
                        .focused($passwordFocused)
                    
                    Divider()
                        .background(passwordFocused ? Color("green01") : Color("black01"))
                }
            }.frame(height: 30)
        }.frame(height: 188)
    }
    
    private var updateButton : some View {
        Button(action: {
            viewModel.saveUserData()
            dismiss()
        }) {
            HStack(alignment: .center, spacing: 10) {
                Text("생성하기")
                    .font(.mainTextMedium16)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, minHeight: 58, maxHeight: 58, alignment: .center)
            .background(isFormValid ? Color("green01") : Color("gray02"))
            .cornerRadius(20)
        }
        .disabled(!isFormValid)
    }
    
    private var isFormValid: Bool {
        !viewModel.signup.nickname.isEmpty &&
        !viewModel.signup.email.isEmpty &&
        !viewModel.signup.password.isEmpty
    }
}

#Preview {
    SignupView()
}
