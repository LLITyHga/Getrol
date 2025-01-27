//
//  AuthorizationFlow.swift
//  Getrol
//
//  Created by Andrii Pikus on 15.01.2025.
//

import Foundation

enum HomeFlow: Hashable {

    enum PopUp: Identifiable, Equatable {
        case fuelBrand(onDismiss: () -> Void)
        case fuelType(onDismiss: () -> Void)
        case settings(onDismiss: () -> Void, onLocation: () -> Void)

        var id: String {
            switch self {
            case .fuelBrand:
                return "fuelBrand"
            case .fuelType:
                return "fuelType"
            case .settings:
                return "settings"
            }
        }

        static func == (lhs: PopUp, rhs: PopUp) -> Bool {
            switch (lhs, rhs) {
            case (.fuelBrand, .fuelBrand),
                (.fuelType, .fuelType),
                (.settings, .settings):
                return true
            default:
                return false
            }
        }
    }

    enum Screen: Identifiable {

        var id: String {
            String(describing: self)
        }
    }

    enum Sheet: Identifiable {

        var id: String {
            String(describing: self)
        }
    }

    enum FullScreenCover: Identifiable {

        var id: String {
            String(describing: self)
        }
    }
}
