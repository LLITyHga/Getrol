//
//  HomeViewModelProtocol.swift
//  Getrol
//
//  Created by Andrii Pikus on 08.01.2025.
//


import SwiftUI
import MapKit

protocol HomeViewModelProtocol: ObservableObject {
    var searchText: String { get set }
    var cameraPosition: MapCameraPosition { get set }
    var isMenuOpen: Bool { get set }
    var isPopupOpen: Bool { get }
    var currentState: SheetState { get }
    var selectedFuel: Int { get }
    
    func onSearchQueryChanged()
    func onRouteAction()
    func onLocationAction()
    func toggleMenu()
}

class HomeViewModel: ObservableObject, HomeViewModelProtocol {
    
    @Published var searchText: String = ""
    @Published var cameraPosition: MapCameraPosition
    @Published var isMenuOpen: Bool = false
    @Published var isPopupOpen: Bool = false
    @Published var currentState: SheetState = .medium
    @Published var selectedFuel: Int = 0
    private let model: HomeModelProtocol
    private let navigation: HomeNavigation
    
    init(model: HomeModelProtocol, navigation: HomeNavigation) {
        self.model = model
        self.navigation = navigation
        self.cameraPosition = .region(model.cameraRegion)
        self.currentState = model.currentState
    }
    
    func changePosition(value: DragGesture.Value) {
        let dragDirection: SheetStateChangeDirection = value.translation.height > 0 ? .down : .up
        model.changeSheetState(dragDirection: dragDirection)
        self.currentState = model.currentState
    }
    
    func onSearchQueryChanged() {
        model.updateSearchQuery(searchText)
    }
    
    func onRouteAction() {
        model.performRouteAction()
    }
    
    func onLocationAction() {
        model.performLocationAction()
    }
    
    func toggleMenu() {
        isMenuOpen.toggle()
    }
    
    func toFuelTypePopup() {
        isPopupOpen = true
        navigation.presentPopUp(.fuelType(onDismiss: {
            self.isPopupOpen = false
        }))
        toggleMenu()
    }

    func toFuelBrandPopup() {
        isPopupOpen = true
        navigation.presentPopUp(.fuelBrand(onDismiss: {
            self.isPopupOpen = false
        }))
        toggleMenu()
    }

    func toSettingsPopup() {
        isPopupOpen = true
        navigation.presentPopUp(.settings(onDismiss: {
            self.isPopupOpen = false
        }))
        toggleMenu()
    }
    
}
