//
//  AppCoordinator.swift
//  Getrol
//
//  Created by Andrii Pikus on 25.12.2024.
//


import SwiftUI
import Swinject

final class AppCoordinator: ObservableObject {
    
    @Published var rootView: AnyView = AnyView(EmptyView())
    
    private var isUserAuthorized = false
    
    init() {
        start()
    }
    
    func start() {
        if isUserAuthorized {
            showMainScreen()
        } else {
            showOnboardingScreen()
        }
    }
}

// MARK: - Private methods
private extension AppCoordinator {
    func showMainScreen() {
        rootView = AnyView(Text("MainScreen"))
    }
    
    func showOnboardingScreen() {
        let onboardingCoordinator = WelcomeFlowCoordinator()
        rootView = AnyView(onboardingCoordinator)
    }
}
