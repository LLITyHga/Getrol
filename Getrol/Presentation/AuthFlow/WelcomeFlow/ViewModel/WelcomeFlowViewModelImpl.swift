//
//  InitialFlowViewModelImpl.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//

import SwiftUI
import Combine

protocol WelcomeFlowViewModel: ObservableObject {
    func proceedFromWelcome()
    func proceedFromLocationPermission()
    func proceedFromFuelTypeSelection()
    func requestLocationPermission()
}

class WelcomeFlowViewModelImpl: ObservableObject, WelcomeFlowViewModel {

    
    private let navigation: WelcomeFlowNavigation
    private let welcomeModel: WelcomeModelProtocol
    
    @Published var isPermissionGranted: Bool = false
    @Published var isPermissionChecked: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(navigation: WelcomeFlowNavigation, welcomeModel: WelcomeModelProtocol) {
        self.navigation = navigation
        self.welcomeModel = welcomeModel
        self.isPermissionGranted = welcomeModel.isPermissionGranted
        // Підписка на зміни в isPermissionGranted і isPermissionChecked
        if let welcomeModel = welcomeModel as? WelcomeModel {
            welcomeModel.$isPermissionGranted
                .receive(on: RunLoop.main)
                .assign(to: &$isPermissionGranted)
            
            welcomeModel.$isPermissionChecked
                .receive(on: RunLoop.main)
                .sink { [weak self] checked in
                    self?.isPermissionChecked = checked
                    self?.handlePermissionStatus()  
                }
                .store(in: &cancellables)
        }
    }
    
    func handlePermissionStatus() {
        guard isPermissionChecked else { return }
        
        if isPermissionGranted {
            navigation.pushScreen(.fuelTypeSelection)
        }
    }
    
    func requestLocationPermission() {
        welcomeModel.requestLocationPermission()
    }
    
    func proceedFromWelcome() {
        navigation.pushScreen(.locationPermission)
    }
    
    func proceedFromLocationPermission() {
        if isPermissionGranted {
            navigation.pushScreen(.fuelTypeSelection)
        }
    }
    
    func proceedFromFuelTypeSelection() {
        navigation.pushScreen(.main)
    }
}
