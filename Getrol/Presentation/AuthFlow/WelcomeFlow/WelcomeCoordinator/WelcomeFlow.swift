//
//  InitialSetupFlow.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//


enum WelcomelFlow {
    enum Screen: Hashable, Identifiable {
        case welcome
        case locationPermission
        case fuelTypeSelection
        case main

        var id: String {
            String(describing: self)
        }
    }
}
