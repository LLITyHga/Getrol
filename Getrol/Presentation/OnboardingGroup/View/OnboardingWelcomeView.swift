//
//  OnboardingWelcomeView.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//


import SwiftUI

struct OnboardingWelcomeView: View {
    @Environment(\.dismiss) private var dismiss
    
    private let loginAction: Action?
    
    init(loginAction: Action?) {
        self.loginAction = loginAction
    }
    
    @State private var activePage: OnboardingPage = .page0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            VStack(spacing: 0) {
                Spacer()
                
                MainContent(size: size)
                
//                IndicatorView()
//                    .padding(.top, 46)
//                
//                Spacer()
//                
//                ButtonsStack()
//                
//                LoginStack()
//                    .padding(.top, 42)
//                    .padding(.bottom, 16)
//                    .onTapGesture {
//                        loginAction?()
//                    }
            }
        }
//        .background{
//            Rectangle()
//                .fill(.secondaryBackground)
//                .ignoresSafeArea()
//        }
    }
}

// MARK: - Views
private extension OnboardingWelcomeView {
    @ViewBuilder
    func MainContent(size: CGSize) -> some View {
        TabView(selection: $activePage) {
//            ForEach(OnboardingPage.allCases, id: \.rawValue) { page in
//                VStack(spacing: 0) {
////                    Text(page.title)
////                        .lineLimit(1)
////                        .foregroundStyle(.black100)
////                        .font(.h1)
//                    
//                    Text(page.subtitle)
//                        .foregroundStyle(.black100)
//                        .font(.h2)
//                        .multilineTextAlignment(.center)
//                        .padding(.top, 16)
//                    
//                    Text(page.body)
//                        .foregroundStyle(.black60)
//                        .font(.body1)
//                        .multilineTextAlignment(.center)
//                        .padding(.top, 36)
//                    
//                    Spacer()
//                    
//                    page.image
//                        .resizable()
//                        .foregroundStyle(.black100)
//                        .frame(width: 60, height: 60)
//                        .padding(.top, 36)
//                }
//            //    .tag(page)
//                .padding(.horizontal, 42)
//            }
//        }
//        .frame(height: size.height / 2)
//        .tabViewStyle(.page(indexDisplayMode: .never))
    }
    
//    @ViewBuilder
//    func IndicatorView() -> some View {
//        HStack(spacing: 8) {
//            ForEach(OnboardingPage.allCases, id: \.rawValue) { page in
//                Circle()
//     //               .fill(.blueRibbon500.opacity(activePage == page ? 1 : 0.3))
//                    .frame(width: 8, height: 8)
//            }
//        }
//        .animation(.smooth, value: activePage)
//        .padding(.vertical, 8)
//        .padding(.horizontal, 12)
//        .background {
//            Capsule()
//            //    .fill(.grayTabIndicator)
//                .blur(radius: 1)
//        }
//    }
    
//    @ViewBuilder
//    func ButtonsStack() -> some View {
//        VStack(spacing: 16) {
//            Button(LS.Onboarding.nextButtonTitle) {
//                if activePage == activePage.lastPage {
//                    self.dismiss()
//                } else {
//                    withAnimation(.spring) {
//                        activePage = activePage.nextPage
//                    }
//                }
//            }
//    //        .buttonStyle(PrimaryDefaultButtonStyle())
//            .padding(.horizontal, 16)
//            
//            Button(LS.Onboarding.skipButtonTitle) {
//                self.dismiss()
//            }
//        //    .buttonStyle(SecondaryDefaultButtonStyle())
//            .padding(.horizontal, 16)
//        }
//    }
//    
//    @ViewBuilder
//    func LoginStack() -> some View {
//        HStack(spacing: 4) {
//            Text(LS.Onboarding.haveAccountLabel)
////                .font(.body2)
////                .foregroundStyle(.grayDark)
//            
//            Text(LS.Onboarding.loginButtonTitle)
////                .font(.Button.link)
////                .foregroundStyle(.black80)
//                .underline()
//        }
    }
}
