//
//  RegistrationNavigation.swift
//  Getrol
//
//  Created by Andrii Pikus on 15.01.2025.
//


import SwiftUI
import Swinject

protocol HomeNavigation {
    func showAlert(config: AlertConfig)
    func presentPopUp(_ content: HomeFlow.PopUp)
    func pop()
}

struct HomeCoordinator: View, HomeNavigation {
    @Binding private var path: NavigationPath
    @State private var popUpItem: HomeFlow.PopUp?
    @State private var alertConfig: AlertConfig?

    init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    var body: some View {
        MainView()
            .popup(item: $popUpItem) { popUp in
                popUpContent(for: popUp)
            }
            .alert(item: $alertConfig) { config in
                Alert(
                    title: Text(config.title)
                        .font(.systemBold)
                        .foregroundStyle(.primary),
                    message: Text(config.message)
                        .font(.systemRegular)
                        .foregroundStyle(.primary),
                    primaryButton: .default(Text(config.okButtonTitle)
                        .font(.systemBold)
                        .foregroundStyle(.blue), action: {
                        config.onOk?()
                        }),
                    secondaryButton: .cancel(Text(config.cancelButtonTitle)
                        .font(.systemRegular)
                        .foregroundStyle(.blue), action: {
                        config.onCancel?()
                    })
                )
            }
            .toolbar(.hidden, for: .navigationBar)
    }
    
    func showAlert(config: AlertConfig) {
        alertConfig = config
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
        case .settings(let onDismiss, let onLocation):
            SettingsPopup(onDismis: onDismiss, onLocaton: onLocation)
          }
    }
}
