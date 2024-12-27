//
//  InitialFlowViewModelImpl.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//

import SwiftUI

protocol WelcomeFlowViewModel: ObservableObject {
    func proceedFromWelcome()
    func proceedFromLocationPermission()
    func proceedFromFuelTypeSelection()
}

class WelcomeFlowViewModelImpl: ObservableObject, WelcomeFlowViewModel {
    private let navigation: WelcomeFlowNavigation
    
    init(navigation: WelcomeFlowNavigation) {
        self.navigation = navigation
    }
    
    func proceedFromWelcome() {
        navigation.pushScreen(.locationPermission)
    }
    
    func proceedFromLocationPermission() {
        navigation.pushScreen(.fuelTypeSelection)
    }
    
    func proceedFromFuelTypeSelection() {
        navigation.pushScreen(.main)
    }
}
