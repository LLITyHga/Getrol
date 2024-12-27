//
//  OnboardingNavigation.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//

import SwiftUI
import Swinject

protocol OnboardingNavigation {
    func presentPopUp(_ content: OnboardingFlow.PopUp)
    func presentFullScreenContent(_ content: OnboardingFlow.FullScreenCover)
    func pushContent(_ content: OnboardingFlow.Screen)
}

struct OnboardingCoordinator: View, OnboardingNavigation {
    @State private var path = NavigationPath()
    @State private var fullScreenPresent: OnboardingFlow.FullScreenCover?
    @State private var popUpContent: OnboardingFlow.PopUp?
    
    var body: some View {
        NavigationStack(path: $path) {
            MainView()
                .navigationDestination(for: OnboardingFlow.Screen.self) { destination in
                    linkDestination(for: destination)
                }
                .fullScreenCover(item: $fullScreenPresent, content: fullScreenContent)
//                .popup(item: $popUpContent) { popUp in
//                    popUpContent(for: popUp)
//                }
                .onAppear {
//                    if UserDefaults.Local.isFirstLaunch {
//                        fullScreenPresent = .welcomeOnboarding
//                    }
                }
        }
    }
    
    func presentPopUp(_ content: OnboardingFlow.PopUp) {
        popUpContent = content
    }
    
    func presentFullScreenContent(_ content: OnboardingFlow.FullScreenCover) {
        fullScreenPresent = content
    }
    
    func pushContent(_ content: OnboardingFlow.Screen) {
        path.append(content)
    }
}

// MARK: - Private methods
private extension OnboardingCoordinator {
    @ViewBuilder
    func MainView() -> some View {
        let model: OnboardingModel = OnboardingModelImpl()
        let viewModel = OnboardingViewModelImpl(model: model, navigation: self)
        let View = OnboardingView(viewModel: viewModel)
        
        View
    }
    
    @ViewBuilder
    func popUpContent(for flow: OnboardingFlow.PopUp) -> some View {
        switch flow {
        case .onboardingPopUp(let guestAction, let registerAction): Text("view")
         //   OnboardingPopupView(continuesAsGuestAction: guestAction, registerAction: registerAction)
        }
    }
    
    @ViewBuilder
    func fullScreenContent(for flow: OnboardingFlow.FullScreenCover) -> some View {
        switch flow {
        case .welcomeOnboarding:
            OnboardingWelcomeView(loginAction: {
                pushContent(.signIn)
            })
            .onDisappear {
             //   UserDefaults.Local.isFirstLaunch = false
            }
        }
    }
    
    @ViewBuilder
    func linkDestination(for flow: OnboardingFlow.Screen) -> some View {
        switch flow {
        case .signIn:
            EmptyView()
        case .signUp:
            EmptyView()
        case .main:
            EmptyView()
        }
    }
}
