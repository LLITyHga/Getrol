//
//  OnboardingFlow.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//


import Foundation

typealias Action = () -> Void

enum OnboardingFlow {
    enum PopUp: Hashable, Identifiable {
        case onboardingPopUp(guestAction: Action, registerAction: Action)
        
        var id: String {
            String(describing: self)
        }
        
        // Conform to Hashable
        func hash(into hasher: inout Hasher) {
          switch self {
          case .onboardingPopUp:
            hasher.combine("onboardingPopUp")
          }
        }
        
        // Conform to Equatable
        static func == (lhs: PopUp, rhs: PopUp) -> Bool {
          switch (lhs, rhs) {
          case (.onboardingPopUp, .onboardingPopUp):
            return true
          }
        }
    }
    
    enum FullScreenCover: Hashable, Identifiable {
        case welcomeOnboarding
        
        var id: String {
            String(describing: self)
        }
    }
    
    enum Screen: Hashable, Identifiable {
        case signIn
        case signUp
        case main
        
        var id: String {
            String(describing: self)
        }
    }
}
