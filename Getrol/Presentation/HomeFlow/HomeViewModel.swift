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
    
    func onSearchQueryChanged()
    func onRouteAction()
    func onLocationAction()
    func toggleMenu()
    func onMenuAction(_ type: MenuButtonType)
}

class HomeViewModel: ObservableObject, HomeViewModelProtocol {
    @Published var searchText: String = ""
    @Published var cameraPosition: MapCameraPosition
    @Published var isMenuOpen: Bool = false

    private let model: HomeModelProtocol
    
    init(model: HomeModelProtocol) {
        self.model = model
        self.cameraPosition = .region(model.cameraRegion)
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
    
    func onMenuAction(_ type: MenuButtonType) {
        model.handleMenuAction(type)
    //    toggleMenu() // Закриваємо меню після вибору дії
    }
}
