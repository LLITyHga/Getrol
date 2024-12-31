//
//  OnboardingView.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//


import SwiftUI

struct OnboardingView<ViewModel: OnboardingViewModel>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
            
            TextStack()
                .padding(.top, 24)
            
//            ButtonsStack()
//                .padding(.top, 42)
        }
    }
}
//MARK: - Views
private extension OnboardingView {
    @ViewBuilder
    func TextStack() -> some View {
        VStack(spacing: 0) {
 //           Text(LS.Onboarding.titleText)
//                .font(.h3)
//                .foregroundStyle(.black100)
//            
//            Text(LS.Onboarding.descriptionText)
//                .frame(maxWidth: 358)
//                .font(.body1)
//                .foregroundStyle(.grayDark)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal, 16)
//                .padding(.top, 8)
//        }
//    }
//    
//    @ViewBuilder
//    func ButtonsStack() -> some View {
//        VStack(spacing: 0) {
//            Button(LS.Onboarding.loginButton, action: {
//                viewModel.pushAuthorizationModuleAction()
//            })
//            .buttonStyle(PrimaryDefaultButtonStyle())
//            .padding(.horizontal, 16)
//            
//            Button(LS.Onboarding.registrationButton, action: {
//                viewModel.pushRegistrationModuleAction()
//            })
//            .buttonStyle(PrimaryDefaultButtonStyle())
//            .padding(.horizontal, 16)
//            .padding(.top, 14)
//            
//            Button(LS.Onboarding.guestButton, action: {
//                viewModel.presentPopUpAction()
//            })
//            .buttonStyle(SecondaryDefaultButtonStyle())
//            .padding([.horizontal, .bottom], 16)
//            .padding(.top, 14)
        }
    }
}

#Preview {
    OnboardingCoordinator()
}
