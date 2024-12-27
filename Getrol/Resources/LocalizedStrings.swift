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
    
    struct Home {
        static let unauthorizatedName = NSLocalizedString("home.text.unauthorizatedName", comment: "")
        static let eventsPoster = NSLocalizedString("home.text.eventsPoster", comment: "")
        static let donate = NSLocalizedString("home.button.donate", comment: "")
        static let participate = NSLocalizedString("home.text.participate", comment: "")
        static let limitedAccess = NSLocalizedString("home.text.limitedAccess", comment: "")
        static let limitedAccessDescription = NSLocalizedString("home.text.limitedAccessDescription", comment: "")
        static let profileCategories = NSLocalizedString("home.text.profileCategories", comment: "")
        static let spotsLeft = NSLocalizedString("home.text.spotsLeft", comment: "")
        static let work = NSLocalizedString("home.button.work", comment: "Work button title")
        static let sponsorship = NSLocalizedString("home.button.sponsorship", comment: "Sponsorship button title")
        static let purchase = NSLocalizedString("home.button.purchase", comment: "Purchase button title")
        static let mentor = NSLocalizedString("home.button.mentor", comment: "Mentor button title")
        static let teacher = NSLocalizedString("home.button.teacher", comment: "Teacher button title")
        static let curator = NSLocalizedString("home.button.curator", comment: "Curator button title")
    }
}
