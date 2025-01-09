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
    var currentState: SheetState { get }
    
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
    @Published var currentState: SheetState
    private let model: HomeModelProtocol
    
    init(model: HomeModelProtocol) {
        self.model = model
        self.cameraPosition = .region(model.cameraRegion)
        self.currentState = model.currentState
    }
    
    func changePosition(value: DragGesture.Value) {
        let dragDirection: SheetStateChangeDirection = value.translation.height > 0 ? .down : .up
        model.changeSheetState(dragDirection: dragDirection)
        self.currentState = model.currentState
        print(" Direction: \(dragDirection)")
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
