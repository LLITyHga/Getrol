//
//  RegistrationNavigation.swift
//  Getrol
//
//  Created by Andrii Pikus on 15.01.2025.
//


import SwiftUI
import Swinject

protocol HomeNavigation {
    func presentPopUp(_ content: HomeFlow.PopUp)
    func pop()
}

struct HomeCoordinator: View, HomeNavigation {
    @Binding private var path: NavigationPath
    @State private var popUpItem: HomeFlow.PopUp?
    
    init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    var body: some View {
        MainView()
            .popup(item: $popUpItem) { popUp in
                popUpContent(for: popUp)
            }
            .toolbar(.hidden, for: .navigationBar)
    }
    
    func presentPopUp(_ content: HomeFlow.PopUp) {
        popUpItem = content
    }
    
    func pop() {
        path.removeLast()
    }
}

// MARK: - Private methods
private extension HomeCoordinator {
    @ViewBuilder
    func MainView() -> some View {
        let model = HomeModel()
        let viewModel = HomeViewModel(model: model, navigation: self)
        let View = HomeView<HomeViewModel>(viewModel: viewModel)
        
        View
    }
    
    @ViewBuilder
    func popUpContent(for flow: HomeFlow.PopUp) -> some View {
        switch flow {
        case .fuelBrand(let onDismiss):
            FuelBrandPopup(onDismis: onDismiss)
        case .fuelType(let onDismiss):
            FuelTypePopup(onDismis: onDismiss)
        case .settings(let onDismiss):
            SettingsPopup(onDismis: onDismiss)
        }
    }
}
