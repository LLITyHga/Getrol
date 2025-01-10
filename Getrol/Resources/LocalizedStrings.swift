//
//  LocalizedStrings.swift
//  Getrol
//
//  Created by Andrii Pikus on 25.12.2024.
//


import Foundation

typealias LS = LocalizedStrings

// MARK: - Localized Strings
struct LocalizedStrings {
    
    struct Common {
        static let errorInputText = String(localized: "common.error.input")
    }
    
    struct Onboarding {
        static let nextButtonTitle = NSLocalizedString("onboarding.button.next", comment: "")
        static let skipButtonTitle = NSLocalizedString("onboarding.button.skip", comment: "")
        static let loginButtonTitle = NSLocalizedString("onboarding.button.login", comment: "")
        static let haveAccountLabel = NSLocalizedString("onboarding.label.haveAccount", comment: "")
       
        struct Page {
            static let title0 = NSLocalizedString("onboarding.page.title0", comment: "")
            static let title1 = NSLocalizedString("onboarding.page.title1", comment: "")
            static let title2 = NSLocalizedString("onboarding.page.title2", comment: "")
            static let title3 = NSLocalizedString("onboarding.page.title3", comment: "")
            
            static let subtitle = NSLocalizedString("onboarding.page.subtitle", comment: "")
            
            static let body0 = NSLocalizedString("onboarding.page.body0", comment: "")
            static let body1 = NSLocalizedString("onboarding.page.body1", comment: "")
            static let body2 = NSLocalizedString("onboarding.page.body2", comment: "")
            static let body3 = NSLocalizedString("onboarding.page.body3", comment: "")
		}
        static let titleText = NSLocalizedString("onboarding.title.text", comment: "")
        static let descriptionText = NSLocalizedString("onboarding.description.text", comment: "")
        static let loginButton = NSLocalizedString("onboarding.button.login", comment: "")
        static let registrationButton = NSLocalizedString("onboarding.button.registration", comment: "")
        static let guestButton = NSLocalizedString("onboarding.button.guest", comment: "")
        
        struct PopUp {
            static let titleText = NSLocalizedString("onboarding.popup.title", comment: "")
            static let messageText = NSLocalizedString("onboarding.popup.message", comment: "")
        }
    }
    
    struct Welcome {
        static let title = NSLocalizedString("welcome.text.title", comment: "Welcome screen title")
        static let greeting = NSLocalizedString("welcome.text.greeting", comment: "Welcome greeting")
        static let description = NSLocalizedString("welcome.text.description", comment: "Welcome description")
        static let buttonNext = NSLocalizedString("welcome.button.next", comment: "Next button title")
    }

    struct LocationPermission {
        static let title = NSLocalizedString("locationPermission.text.title", comment: "Location permission screen title")
        static let description = NSLocalizedString("locationPermission.text.description", comment: "Location permission description")
        static let buttonNext = NSLocalizedString("locationPermission.button.next", comment: "Next button title")
    }

    struct FuelTypeSelection {
        static let title = NSLocalizedString("fuelTypeSelection.text.title", comment: "Fuel type selection screen title")
        static let note = NSLocalizedString("fuelTypeSelection.text.note", comment: "Fuel type selection note")
        static let buttonNext = NSLocalizedString("fuelTypeSelection.button.next", comment: "Next button title")
        static let petrolOption = NSLocalizedString("fuelTypeSelection.option.petrol", comment: "Petrol option")
        static let dieselOption = NSLocalizedString("fuelTypeSelection.option.diesel", comment: "Diesel option")
    }
    
    struct Home {
        static let search = NSLocalizedString("home.text.search", comment: "")
        static let price = NSLocalizedString("home.text.price", comment: "")
        static let distance = NSLocalizedString("home.text.distance", comment: "")
    }
}
