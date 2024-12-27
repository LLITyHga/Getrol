//
//  OnboardingViewModel.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//


import SwiftUI

protocol OnboardingViewModel: ObservableObject {
    func pushRegistrationModuleAction()
    func pushAuthorizationModuleAction()
    func pushMainFlowAction()
    func presentPopUpAction()
}

class OnboardingViewModelImpl: OnboardingViewModel {
    private let model: OnboardingModel
    private let navigation: OnboardingNavigation
    
    init(model: OnboardingModel, navigation: OnboardingNavigation) {
        self.model = model
        self.navigation = navigation
    }
    
    func pushRegistrationModuleAction() {
        navigation.pushContent(.signIn)
    }
    
    func pushAuthorizationModuleAction() {
        navigation.pushContent(.signUp)
    }
    
    func pushMainFlowAction() {
        navigation.pushContent(.main)
    }
    
    func presentPopUpAction() {
        navigation.presentPopUp(
            .onboardingPopUp(
                guestAction: { self.navigation.pushContent(.main) },
                registerAction: { self.navigation.pushContent(.signUp) }
            )
        )
    }
}