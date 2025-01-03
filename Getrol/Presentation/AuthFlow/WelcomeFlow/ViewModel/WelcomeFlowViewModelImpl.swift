//
//  InitialFlowViewModelImpl.swift
//  Getrol
//
//  Created by Andrii Pikus on 26.12.2024.
//

import SwiftUI
import Combine

protocol WelcomeFlowViewModel: ObservableObject {
    var isPermissionGranted: Bool { get }
    var selectedFuelType: Int { get set }
    
    func proceedFromWelcome()
    func proceedFromLocationPermission()
    func proceedFromFuelTypeSelection()
    func requestLocationPermission()
    func setFuelType(_ type: Int)
    func handlePermissionStatus() // Метод для ручної обробки статусу дозволів
}

class WelcomeFlowViewModelImpl: ObservableObject, WelcomeFlowViewModel, WelcomeModelDelegate {
    private let navigation: WelcomeFlowNavigation
    private let welcomeModel: WelcomeModelProtocol
    
    @Published var isPermissionGranted: Bool
    @Published var selectedFuelType: Int
    private var didNavigateToNextScreen = false
    
    init(navigation: WelcomeFlowNavigation, welcomeModel: WelcomeModelProtocol) {
        self.navigation = navigation
        self.welcomeModel = welcomeModel
        self.isPermissionGranted = welcomeModel.isPermissionGranted
        self.selectedFuelType = welcomeModel.selectedFuelType
        
        if let model = welcomeModel as? WelcomeModel {
            model.delegate = self
        }
    }
    
    func permissionStatusDidChange(isGranted: Bool) {
        isPermissionGranted = isGranted
        if !didNavigateToNextScreen {
            handlePermissionStatus()
        }
    }
    
    func requestLocationPermission() {
        welcomeModel.requestLocationPermission()
    }
    
    func setFuelType(_ type: Int) {
        welcomeModel.setSelectedFuelType(type)
        selectedFuelType = type
    }
    
    func handlePermissionStatus() {
        if isPermissionGranted, !didNavigateToNextScreen {
            didNavigateToNextScreen = true
            proceedFromLocationPermission()
        }
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
